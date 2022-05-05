/*import 'package:device_information/device_information.dart';

class DeviceInfo {
  static String? platformVersion,
      imeiNo = '',
      modelName = '',
      manufacturer = '',
      deviceName = '',
      productName = '',
      cpuType = '',
      hardware = '',
      apiLevel;
  // Platform messages are asynchronous, so we initialize in an async method.
  static Future<void> initPlatformState() async {
    // Platform messages may fail,
    // so we use a try/catch PlatformException.
    try {
      platformVersion = await DeviceInformation.platformVersion;
      imeiNo = await DeviceInformation.deviceIMEINumber;
      modelName = await DeviceInformation.deviceModel;
      manufacturer = await DeviceInformation.deviceManufacturer;
      apiLevel = (await DeviceInformation.apiLevel).toString();
      deviceName = await DeviceInformation.deviceName;
      productName = await DeviceInformation.productName;
      cpuType = await DeviceInformation.cpuName;
      hardware = await DeviceInformation.hardware;
    } catch (e) {
      platformVersion = e.toString();
    }
  }
}*/
