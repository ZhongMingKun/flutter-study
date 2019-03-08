import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
// class NavigatorItem {
//   String path;
//   String title;
// }
const navigators = [
  {'path': '/use-app-img', 'title': '图片轮播v1'},
  {'path': '/use-storage-img', 'title': '图片轮播v2'},
  {'path': '/video-player-demo', 'title': '视频播放'},
  {'path': '/download-demo', 'title': '下载demo'},
  {'path': '/shower-demo', 'title': '混播demo'},
  {'path': '/screenpage-demo', 'title': '布局demo'},
];


class AppHome extends StatefulWidget {
  final TargetPlatform platform;
  AppHome({Key key, this.platform}) : super(key: key);

  @override
  _AppHomeState createState() => new _AppHomeState();

}

class _AppHomeState extends State<AppHome>{
  bool _permissisonReady;
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _permissisonReady = false;
    _prepare();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('广告轮播')
      ),
      body: Builder(
        builder: (context) => _isLoading
          ? new Center(
              child: new CircularProgressIndicator(),
            )
          : _permissisonReady
              ? _buildNavigators()
              : _buildPermission()
      ),
    );
  }

  Widget _buildNavigators() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int i) {
        return _buildRow(context, navigators[i]);
      },
      itemCount: navigators.length,
    );
  }

  Widget _buildRow(BuildContext context, info) {
    return InkWell(
      onTap: () => Navigator.pushNamed( context, info['path']),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 20.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Theme.of(context).dividerColor)
          )
        ),
        child: Text(info['title']),
      )
    );
  }

  Widget _buildPermission() {
    return new Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                '需要读写文件的权限',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blueGrey, fontSize: 18.0),
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            FlatButton(
                onPressed: () {
                  _checkPermission().then((hasGranted) {
                    setState(() {
                      _permissisonReady = hasGranted;
                    });
                  });
                },
                child: Text(
                  '重新获取',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ))
          ],
        ),
      ),
    );
  }

  Future<Null> _prepare() async {
    _permissisonReady = await _checkPermission();
    setState(() {
      _isLoading = false;
    });
  }

  Future<bool> _checkPermission() async {
    if (widget.platform == TargetPlatform.android) {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      if (permission != PermissionStatus.granted) {
        Map<PermissionGroup, PermissionStatus> permissions =
            await PermissionHandler()
                .requestPermissions([PermissionGroup.storage]);
        if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }
}
