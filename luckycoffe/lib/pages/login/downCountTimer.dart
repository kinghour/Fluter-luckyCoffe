import 'dart:async';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import '../../common/macros.dart';

typedef passSecond<T> = void Function(T value);

/// 墨水瓶（`InkWell`）可用时使用的字体样式。
final TextStyle _availableStyle = TextStyle(
  fontSize: 14.0,
  color: hexColor('#808080'),
);

/// 墨水瓶（`InkWell`）不可用时使用的样式。
final TextStyle _unavailableStyle = TextStyle(
  fontSize: 14.0,
  color: hexColor('#808080'),
);

// ignore: must_be_immutable
class DownCountTimer extends StatefulWidget {
  /// 倒计时的秒数，默认60秒。
 final int countdown;

 final passSecond <int> onSecond;

  /// 用户点击时的回调函数。
 final Function onTapCallback;

  /// 是否可以获取验证码，默认为`false`。
 final bool available;

 ///需要验证的手机号码
 final String phoneNum;

  DownCountTimer({this.countdown, this.available,this.onSecond,this.phoneNum,this.onTapCallback});

  @override
  _DownCountTimerState createState() => _DownCountTimerState();
}

class _DownCountTimerState extends State<DownCountTimer> {
  /// 倒计时的计时器。
  Timer _timer;

  /// 当前倒计时的秒数。
  int _seconds;

  /// 当前墨水瓶（`InkWell`）的字体样式。
  TextStyle inkWellStyle = _availableStyle;

  /// 当前墨水瓶（`InkWell`）的文本。
  String _verifyStr = '获取验证码';

  @override
  void initState() {
    super.initState();

    _seconds = widget.countdown;
  }

  //释放timer 防止内存泄漏
  @override
  void dispose() {

    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 墨水瓶（`InkWell`）组件，响应触摸的矩形区域。
    return widget.available
        ? GestureDetector(
            child: Text(
              '  $_verifyStr  ',
              style: inkWellStyle,
            ),
            onTap: (_seconds == widget.countdown)
                ? () {

              //判断手机号输入是否为空
              if(widget.phoneNum == null || widget.phoneNum.length <=0){
                showToast('请输入手机号');
                return;
              }
              //判断手机号输入格式是否正确
              bool yy = RegExp('^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$').hasMatch(widget.phoneNum);
              if(!yy){
                showToast('请输入正确的手机号');
                return;
              }
                    _startTimer();
                    inkWellStyle = _unavailableStyle;
                    _verifyStr = '已发送$_seconds' + 's';
                    setState(() {

                    });
                    widget.onTapCallback();
                  }
                : null,
          )
        : InkWell(
            child: Text(
              '获取验证码',
              style: _unavailableStyle,
            ),
          );
  }

  /// 启动倒计时的计时器。
  void _startTimer() {


    // 计时器（`Timer`）组件的定期（`periodic`）构造函数，创建一个新的重复计时器。
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {

      if (_seconds == 0) {
        _cancelTimer();
        _seconds = widget.countdown;
        inkWellStyle = _availableStyle;
        setState(() {});
        return;
      }
      _seconds--;
      widget.onSecond(_seconds);
      print('111111111');
      _verifyStr = '已发送$_seconds' + 's';
      setState(() {});
      if (_seconds == 0) {
        _verifyStr = '重新发送';

      }
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    // 计时器（`Timer`）组件的取消（`cancel`）方法，取消计时器。
    _timer?.cancel();
  }
}
