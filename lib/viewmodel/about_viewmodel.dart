import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_weather/common/streams.dart';
import 'package:flutter_weather/model/data/version_data.dart';
import 'package:flutter_weather/model/service/app_version_service.dart';
import 'package:flutter_weather/utils/channel_util.dart';
import 'package:flutter_weather/utils/system_util.dart';
import 'package:flutter_weather/viewmodel/viewmodel.dart';

class AboutViewModel extends ViewModel {
  final _service = AppVersionService();

  final updateResult = StreamController<bool>();
  final version = StreamController<VersionData>();

  void checkUpdate() async {
    if (selfLoading) return;

    selfLoading = true;
    streamAdd(isLoading, true);

    try {
      final data = await _service.getVersion();
      streamAdd(version, data);
    } on DioError catch (e) {
      doError(e);
    } finally {
      selfLoading = false;
      streamAdd(isLoading, false);
    }
  }

  /// Android专用
  void updateApp(String url, int code) async {
    if (isIOS) return;

    final result =
        await ChannelUtil.updateApp(url: url, verCode: code, isWifi: false);
    streamAdd(updateResult, result);
  }

  @override
  void dispose() {
    _service.dispose();

    version.close();
    updateResult.close();

    super.dispose();
  }
}
