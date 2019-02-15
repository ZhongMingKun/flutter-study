import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// class NavigatorItem {
//   String path;
//   String title;
// }

const navigators = [
  {'path': '/use-app-img', 'title': '图片轮播v1'},
  {'path': '/use-storage-img', 'title': '图片轮播v2'},
];


class AppHome extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('广告轮播')
      ),
      body: _buildNavigators(),
    );
  }
}
