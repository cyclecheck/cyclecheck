import 'dart:convert';
import 'dart:io' show Platform;

import 'package:crypto/crypto.dart';
import 'package:device_info/device_info.dart';

const String DEFAULT_SESSION_KEY = 'unknown';

class KeyGenerator {
  DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo _androidInfo;
  IosDeviceInfo _iosInfo;

  Future<String> gen() async {
    try {
      if (_androidInfo == null || _iosInfo == null) {
        await _getInfo();
      }

      return Platform.isIOS
          ? _generateIosKey(_iosInfo)
          : _generateAndroidKey(_androidInfo);
    } catch (error) {
      return DEFAULT_SESSION_KEY;
    }
  }

  String _generateAndroidKey(AndroidDeviceInfo info) {
    String hash = _generateHash([info.androidId]);
    return "android-$hash";
  }

  String _generateIosKey(IosDeviceInfo info) {
    String model = info.name;
    String version = info.systemVersion;
    String hash = _generateHash([model, version, info.identifierForVendor]);
    return "ios-$hash";
  }

  String _generateHash(List<String> args) {
    List<int> hash = utf8.encode(args.join('-'));
    return md5.convert(hash).toString();
  }

  Future _getInfo() async {
    try {
      if (Platform.isIOS) {
        _iosInfo = await _deviceInfo.iosInfo;
      } else if (Platform.isAndroid) {
        _androidInfo = await _deviceInfo.androidInfo;
      } else {
        throw ('Unsupported platform');
      }
    } catch (error) {
      throw ('Unable to retreive device information...');
    }

    if (_androidInfo == null || _iosInfo == null) {
      throw ('Device information was null');
    }
  }
}
