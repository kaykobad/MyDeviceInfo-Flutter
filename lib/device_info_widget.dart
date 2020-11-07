import 'dart:async';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_device_info/constants.dart';
import 'package:system_info/system_info.dart';

class DeviceInfo extends StatefulWidget {
  @override
  _DeviceInfoState createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, String> _deviceData = <String, String>{};
  List<TableRow> _deviceInfoTableRows = [];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    Map<String, dynamic> deviceData;

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
      _getExtraDeviceData().forEach((key, value) {
        _deviceInfoTableRows.add(
            TableRow(
                children: [
                  Text(key),
                  Text(value),
                ]
            )
        );
      });
      _deviceData.forEach((key, value) {
        _deviceInfoTableRows.add(
          TableRow(
            children: [
              Text(key),
              Text(value),
            ]
          )
        );
      });
    });
  }

  Map<String, String> _getExtraDeviceData() {
    const int MEGABYTE = 1024 * 1024;

    return <String, String> {
      'Kernel Architecture:': SysInfo.kernelArchitecture,
      'Kernel Name:': SysInfo.kernelName,
      'Kernel Version:': SysInfo.kernelVersion,
      'OS Name:': SysInfo.operatingSystemName,
      'OS Version:': SysInfo.operatingSystemVersion,
      'User Directory:': SysInfo.userDirectory,
      'User ID:': SysInfo.userId,
      'User Name:': SysInfo.userName,
      'No of Processors:': SysInfo.processors.length.toString(),
      'Total Physical Memory:': '${(SysInfo.getTotalPhysicalMemory() ~/ MEGABYTE)} MB',
      'Free Physical Memory:': '${(SysInfo.getFreePhysicalMemory() ~/ MEGABYTE)} MB',
      'Total Virtual Memory:': '${(SysInfo.getTotalVirtualMemory() ~/ MEGABYTE)} MB',
      'Free Virtual Memory:': '${(SysInfo.getFreeVirtualMemory() ~/ MEGABYTE)} MB',
      'Virtual Memory Size:': '${(SysInfo.getVirtualMemorySize() ~/ MEGABYTE)} MB',
    };
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, String> {
      'Security Patch Version:': build.version.securityPatch,
      'SDK Version:': build.version.sdkInt.toString(),
      'Release Version:': build.version.release,
      'Preview Sdk Version:': build.version.previewSdkInt.toString(),
      'Incremental Version:': build.version.incremental,
      'Code Name Version:': build.version.codename,
      'Base OS Version:': build.version.baseOS,
      'Board:': build.board,
      'Bootloader:': build.bootloader,
      'Brand:': build.brand,
      'Device:': build.device,
      'Display:': build.display,
      'Fingerprint:': build.fingerprint,
      'Hardware:': build.hardware,
      'Host:': build.host,
      'ID:': build.id,
      'Manufacturer:': build.manufacturer,
      'Model:': build.model,
      'Product': build.product,
      'Supported 32Bit Abis:': build.supported32BitAbis.join(', '),
      'Supported 64Bit Abis:': build.supported64BitAbis.join(', '),
      'Supported Abis:': build.supportedAbis.join(', '),
      'Tags:': build.tags,
      'Type:': build.type,
      'Is Physical Device:': build.isPhysicalDevice.toString(),
      'Android ID:': build.androidId,
      'System Features:': build.systemFeatures.join(', '),
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, String>{
      'Name:': data.name,
      'System Name:': data.systemName,
      'System Version:': data.systemVersion,
      'Model:': data.model,
      'Localized Model:': data.localizedModel,
      'Identifier For Vendor:': data.identifierForVendor,
      'Is Physical Device:': data.isPhysicalDevice.toString(),
      'utsname (sysname):': data.utsname.sysname,
      'utsname (nodename):': data.utsname.nodename,
      'utsname (release):': data.utsname.release,
      'utsname (version):': data.utsname.version,
      'utsname (machine):': data.utsname.machine,
    };
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                ProjectConstants.buttonIcons[2],
                size: 36,
                color: Colors.white,
              ),
              Text(
                ' ${ProjectConstants.buttonLabels[2]}',
                style: ProjectConstants.white32,
              )
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
            child: Table(
              columnWidths: {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(1),
              },
              children: _deviceInfoTableRows,
            ),
          ),
        ],
      ),
    );
  }
}
