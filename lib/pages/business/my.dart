import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('我的'), centerTitle: true),
      body: ListView(
        children: [
          _buildUserInfo(),
          _buildMenuItem(
            '我的订单',
            Icons.shopping_cart,
            onTap: () {
              // 跳转到订单页面
              Navigator.pushNamed(context, '/orders');
            },
          ),
          _buildMenuItem(
            '我的收藏',
            Icons.favorite,
            onTap: () {
              // 跳转到收藏页面
              Navigator.pushNamed(context, '/favorites');
            },
          ),
          _buildMenuItem(
            '设置',
            Icons.settings,
            onTap: () {
              // 跳转到设置页面
              Navigator.pushNamed(context, '/settings');
            },
          ),
          _buildMenuItem(
            '关于我们',
            Icons.info,
            onTap: () {
              // 跳转到关于页面
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
    );
  }

  // 构建用户信息区域
  Widget _buildUserInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/avatar.png'), // 用户头像
            backgroundColor: Colors.white,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '王杰',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '开发 / 结构思考者 / 创新者',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withAlpha(
                    204,
                  ), // 使用 withAlpha，204 = 255 * 0.8
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 构建菜单项
  Widget _buildMenuItem(
    String title,
    IconData icon, {
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.amber),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
