import 'package:assistant/api/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  HomeApi homeApi = HomeApi();

  @override
  void initState() {
    super.initState();
    homeApi.getBanners();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => homeApi,
      child: Scaffold(
        appBar: AppBar(title: Text("首页")),
        body: SafeArea(
          child: Column(
            children: [
              _bannerView(),
            ],
          ),
        ),
      ),
    );
  }

  // 轮播view
  Widget _bannerView() {
    return Consumer<HomeApi>(
      builder: (context, apiData, child) {
        return SizedBox(
          width: double.infinity,
          height: 200,
          child: Swiper(
            itemBuilder: (context, index) {
              return Image.network(
                apiData.bannerData?[index].imagePath ?? "",
                fit: BoxFit.fill,
              );
            },
            itemCount: apiData.bannerData?.length ?? 0,
            pagination: const SwiperPagination(),
            autoplay: true, // 自动播放
            onTap: (index) {
              Navigator.pushNamed(context, "/talk", arguments: {"a": "b"});
            },
          ),
        );
      },
    );
  }
}
