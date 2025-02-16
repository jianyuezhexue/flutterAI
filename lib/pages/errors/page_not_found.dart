import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('页面未找到'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 404 图标
            const Icon(
              Icons.error_outline,
              size: 100,
              color: Colors.amber,
            ),
            const SizedBox(height: 20),

            const SizedBox(height: 10),

            // 描述
            const Text(
              '哎呀，页面走丢了！',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),

            // 返回首页按钮
            ElevatedButton(
              onPressed: () {
                // 返回首页
                Navigator.of(context).pushReplacementNamed('/');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber, // 按钮背景颜色
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // 圆角按钮
                ),
              ),
              child: const Text(
                '返回首页',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}