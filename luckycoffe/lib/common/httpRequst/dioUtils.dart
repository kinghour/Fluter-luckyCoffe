import 'package:dio/dio.dart';
import 'package:oktoast/oktoast.dart';

import 'dioInterceptor.dart';

/*
 * 封装 restful 请求
 *
 * GET、POST、DELETE、PATCH
 * 主要作用为统一处理相关事务：
 *  - 统一处理请求前缀；
 *  - 统一打印请求信息；
 *  - 统一打印响应信息；
 *  - 统一打印报错信息；
 */
class DioUtils {
  /// global dio object
  static Dio dio;

  /// default options
  static const String Base_URL =
      'https://api.it120.cc/b956ecefe528bcc1fd922fd4458913d9/';
  static const String Test_URL =
      'https://api.it120.cc/b956ecefe528bcc1fd922fd4458913d9/';
  static const int CONNECT_TIMEOUT = 15000;
  static const int RECEIVE_TIMEOUT = 15000;
  static const String TOKEN = "b956ecefe528bcc1fd922fd4458913d9";

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  /// 创建 dio 实例对象
  static Dio createInstance() {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
          connectTimeout: CONNECT_TIMEOUT,
          receiveTimeout: RECEIVE_TIMEOUT,
          responseType: ResponseType.json,
          validateStatus: (status) {
            // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
            return true;
          },
          baseUrl: Base_URL,
          headers: httpHeaders);

      dio = new Dio(options);
      dio.interceptors.add(DioLogInterceptor());
    }
    return dio;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }

  static Future<Response> testPost<T>(
    String url, {
    Map<String, dynamic> parameters,
    Function(T) onSuccess,
    Function(String error) onError,
  }) async {
    try {
      Response response;
      Dio dio = createInstance();
      response = await dio.post(url, queryParameters: parameters);
      if (onSuccess != null) {
        onSuccess(response.data);
      }
      return response;
    } on DioError catch (e) {
      print('请求出错：' + e.toString());
      onError(e.toString());
//      resultError(e);
    }
  }

  static testGet({String url})async{
    Response response;
    Dio dio = createInstance();
    response = await dio.get(url, queryParameters: {'11':'11'});
    return response;
  }

  ///Get请求
  static void getHttp(
    String url, {
    Map<String, dynamic> parameters,
    Function(Response) onSuccess,
    Function(String error) onError,
  }) async {
    ///定义请求参数

    try {
      Response response;
      Dio dio = createInstance();
      response = await dio.get(url, queryParameters: parameters);
      if (onSuccess != null) {
        onSuccess(response);
      }
    } on DioError catch (e) {
      print('请求出错：' + e.toString());
      onError(e.toString());
//      resultError(e);
    }
  }

  ///Post请求
  static void postHttp<T>(
    String url, {
    Map<String, dynamic> parameters,
    Function(T) onSuccess,
    Function(String error) onError,
  }) async {
    try {
      Response response;
      Dio dio = createInstance();
      response = await dio.post(url, queryParameters: parameters);
      if (onSuccess != null) {
        onSuccess(response.data);
      }
    } on DioError catch (e) {
      print('请求出错：' + e.toString());
      onError(e.toString());
//      resultError(e);
    }
  }

  /// request Get、Post 请求
  //url 请求链接s
  //parameters 请求参数
  //method 请求方式
  //onSuccess 成功回调
  //onError 失败回调
  static void requestHttp<T>(String url,
      {parameters,
      method,
      Function(T t) onSuccess,
      Function(String error) onError}) async {
    parameters = parameters ?? {};
    method = method ?? 'GET';

    if (method == DioUtils.GET) {
//      getHttp(
//        url,
//        parameters: parameters,
//        onSuccess: (data) {
//          onSuccess(data);
//        },
//        onError: (error) {
//          onError(error);
//        },
//      );
    } else if (method == DioUtils.POST) {
      postHttp(
        url,
        parameters: parameters,
        onSuccess: (data) {
          onSuccess(data);
        },
        onError: (error) {
          onError(error);
        },
      );
    }
  }
}

///网络请求错误提示
resultError(DioError e) {
  Response errorResponse;
  if (e.response != null) {
    errorResponse = e.response;
  } else {
    errorResponse = Response(statusCode: 666);
  }
  if (e.type == DioErrorType.CONNECT_TIMEOUT ||
      e.type == DioErrorType.RECEIVE_TIMEOUT) {
    showToast('网络超时');
  }
}

/// 自定义Header
Map<String, dynamic> httpHeaders = {
  'Accept': 'application/json,*/*',
  'Content-Type': 'application/json',
  'token': DioUtils.TOKEN
};
