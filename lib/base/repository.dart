import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'http_manager.dart';
import 'package:fish_architecture/entity/entity_factory.dart';
import 'package:fish_architecture/ux/toast.dart';

enum Method {
  GET,
  POST,
}

class Repository {
  Observable<T> loadFormAsset<T>(BuildContext context, String path) {
    return Observable.fromFuture(
            DefaultAssetBundle.of(context).loadString(path))
        .map((jsonStr) {
      return EntityFactory.generateOBJ<T>(json.decode(jsonStr));
    });
  }

  /// 基于rx实现异步请求
  Observable<M> rxFetch<M>(BuildContext context, String path,
      {Map params, Method method = Method.GET, bool showLoading = true}) {
//    var future = HttpManager.getInstance().getData(tree);
    Future<dynamic> future;
    if (method == Method.POST) {
      future = HttpManager.getInstance().post(path,queryParameters: params);
    } else if (method == Method.GET) {
      future = HttpManager.getInstance().get(path,queryParameters: params);
    }
    return Observable.fromFuture(future).doOnListen(() {
      debugPrint("Repository doOnListen:");

      ///todo 开始请求接口时通用逻辑处理
      if (showLoading) {
//        ZDProgressHUD.show("加载中", context);
      }
    }).map((resObj) {
//      debugPrint("Repository map: $resObj");
      if (M.toString() == "ResObj") {
        return resObj as M;
      } else {
        return EntityFactory.generateOBJ<M>(resObj.data);
      }
    }).doOnData((onData) {
      debugPrint("Repository doOnData: $onData");
      if (showLoading) {
//        ZDProgressHUD.dismss();
      }
    }).doOnError((error, stacktrace) {
      ///todo 通用错误处理
      if (showLoading) {
//        ZDProgressHUD.dismss();
      }
      debugPrint("Repository error: $error \n $stacktrace");
      _onError(error, context);
    }).doOnDone(() {
      debugPrint("Repository doOnDone:");

      ///todo 请求结束通用逻辑处理
    });
  }

  void _onError(error, BuildContext context) {
    if (error is DioError) {
      switch ((error as DioError).type) {
        case DioErrorType.CONNECT_TIMEOUT:
        case DioErrorType.RECEIVE_TIMEOUT:
        case DioErrorType.SEND_TIMEOUT:
          Toast.show(context, "服务器超时");
          break;
        case DioErrorType.CANCEL:
        case DioErrorType.RESPONSE:
          // code == 707
          // 跳转登录
          Toast.show(context, "登陆超时");

          break;
        case DioErrorType.DEFAULT:
          Toast.show(context, "服务器异常");
          break;
      }
    }
  }

  /// 基于future实现异步请求
  Future<M> fetch<M>(BuildContext context, String path,
      {Map params,
      Method method = Method.GET,
      bool showLoading = false}) async {
    Future<dynamic> future;
    if (method == Method.POST) {
      future = HttpManager.getInstance().post(path,queryParameters: params);
    } else if (method == Method.GET) {
      future = HttpManager.getInstance().get(path,queryParameters: params);
    }
    return future.then((value) {
      debugPrint("Repository value: $value");
      if (M.toString() == "ResObj") {
        return value as M;
      } else {
        return EntityFactory.generateOBJ<M>(value);
      }
    }).catchError((error, stacktrace) {
      debugPrint("Repository error: $error \n $stacktrace");
      _onError(error, context);
      return error;
    });
  }
}
