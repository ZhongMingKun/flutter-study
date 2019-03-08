import 'package:flutter/material.dart';

import 'common/api.dart';
import 'pages/login.dart';
import 'pages/home.dart';
import 'pages/use_app_img.dart';
import 'pages/use_storage_img.dart';
import 'pages/video_player_demo.dart';
import 'pages/download_demo.dart';
import 'components/shower.dart';
import 'components/screen_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  // final TargetPlatform platform;
  // MyApp({Key key, this.platform}) : super(key: key);
  @override
  _MyAppState createState() => new _MyAppState();

}

class _MyAppState extends State<MyApp> {
  // bool _rootAccess = false;

  // @override
  // void initState() {
  //   super.initState();
  //   initRootRequest();
  // }

  // Future<void> initRootRequest() async {
  //   bool rootAccess = await RootAccess.rootAccess;

  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;

  //   setState(() {
  //     _rootAccess = rootAccess;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final TargetPlatform platform = Theme.of(context).platform;
    final dirPath = '/material';
    final List<Map<String, dynamic>> _showList = [
      {
        'name':'The_Organ_at_Arches_National_Park_Utah_Corrected.jpg',
        'type': 'image',
        'delay': 5000
      },
      {
        'name': 'BigBuckBunny.mp4',
        'type': 'video'
      },
      {
        'name': 'Canyonlands_National_Park%E2%80%A6Needles_area_%286294480744%29.jpg',
        'type': 'image',
        'delay': 5000
      },
      {
        'name': 'ElephantsDream.mp4',
        'type': 'video'
      },
      {
        'name': 'Sand_Dunes_in_Death_Valley_National_Park.jpg',
        'type': 'image',
        'delay': 5000
      }
    ];
    final screenSetting = {
      'id': '123',
      // 'mode': 'fullScreen',
      'mode': 'twoScreen',
      // 'mode': 'threeScreen50',
      // 'mode': 'threeScreen66',
      // 'mode': 'fourScreenVertial',
      // 'mode': 'fourScreenSquare',
      'blocks': [
        {
          'blockNo': 1,
          'files': [
            {
              'name':'The_Organ_at_Arches_National_Park_Utah_Corrected.jpg',
              'type': 'image',
              'delay': 5000
            },
            {
              'name': 'BigBuckBunny.mp4',
              'type': 'video'
            },
            {
              'name': 'Canyonlands_National_Park%E2%80%A6Needles_area_%286294480744%29.jpg',
              'type': 'image',
              'delay': 5000
            },
            {
              'name': 'ElephantsDream.mp4',
              'type': 'video'
            },
            {
              'name': 'Sand_Dunes_in_Death_Valley_National_Park.jpg',
              'type': 'image',
              'delay': 5000
            }
          ]
        },
        {
          'blockNo': 2,
          'files': [
            {
              'name': 'BigBuckBunny.mp4',
              'type': 'video'
            },
            {
              'name': 'ElephantsDream.mp4',
              'type': 'video'
            },
            {
              'name': 'Canyonlands_National_Park%E2%80%A6Needles_area_%286294480744%29.jpg',
              'type': 'image',
              'delay': 5000
            },
            {
              'name': 'Sand_Dunes_in_Death_Valley_National_Park.jpg',
              'type': 'image',
              'delay': 5000
            },
            {
              'name':'The_Organ_at_Arches_National_Park_Utah_Corrected.jpg',
              'type': 'image',
              'delay': 5000
            },
          ]
        }
      ],
    };
    // print(widget.platform);
    Api().test({'tag': 1});
    // print('Root access granted: $_rootAccess\n');
    return new MaterialApp(
      title: 'Welcome to Flutter',
      routes: <String, WidgetBuilder>{
        // '/': (BuildContext context) => LoginPage(),
        // '/home': (BuildContext context) => AppHome(),
        '/': (BuildContext context) => AppHome(platform: platform),
        '/use-app-img': (BuildContext context) => UseAppImgPage(),
        '/use-storage-img': (BuildContext context) => UseStorageImgPage(),
        '/video-player-demo': (BuildContext context) => VideoDemoPage(),
        '/download-demo': (BuildContext context) => DownloadDemo(platform: platform),
        '/shower-demo': (BuildContext context) => Shower(showList: _showList, dirPath: dirPath),
        '/screenpage-demo': (BuildContext context) => ScreenPage(screenSetting: screenSetting),
      });
  }

  // Future<bool> _checkPermission() async {
  //   if (widget.platform == TargetPlatform.android) {
  //     PermissionStatus permission = await PermissionHandler()
  //         .checkPermissionStatus(PermissionGroup.storage);
  //     if (permission != PermissionStatus.granted) {
  //       Map<PermissionGroup, PermissionStatus> permissions =
  //           await PermissionHandler()
  //               .requestPermissions([PermissionGroup.storage]);
  //       if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
  //         return true;
  //       }
  //     } else {
  //       return true;
  //     }
  //   } else {
  //     return true;
  //   }
  //   return false;
  // }
}

