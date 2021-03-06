import 'package:flutter/material.dart';
import 'package:flutter_weather/common/colors.dart';
import 'package:flutter_weather/language.dart';
import 'package:flutter_weather/model/holder/event_send_holder.dart';
import 'package:flutter_weather/view/page/gift_egg_page.dart';
import 'package:flutter_weather/view/page/gift_gank_page.dart';
import 'package:flutter_weather/view/page/gift_mzi_page.dart';
import 'package:flutter_weather/view/widget/custom_app_bar.dart';

class GiftPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Column(
        children: <Widget>[
          CustomAppBar(
            title: Text(
              AppText.of(context).gift,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            color: Theme.of(context).accentColor,
            leftBtn: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () => EventSendHolder()
                  .sendEvent(tag: "homeDrawerOpen", event: true),
            ),
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              isScrollable: true,
              tabs: [
                Tab(text: AppText.of(context).gank),
                Tab(text: AppText.of(context).egg),
                Tab(text: AppText.of(context).beachGirl),
                Tab(text: AppText.of(context).mostHot),
                Tab(text: AppText.of(context).taiwanGirl),
                Tab(text: AppText.of(context).sexGirl),
                Tab(text: AppText.of(context).japanGirl),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: AppColor.colorRead,
              child: TabBarView(
                children: [
                  GiftGankPage(
                    key: Key("GiftGankPage"),
                  ),
                  GiftEggPage(
                    key: Key("GiftEggPage"),
                  ),
                  GiftMziPage(
                    key: Key("GiftMziPagemm"),
                    typeUrl: "mm",
                  ),
                  GiftMziPage(
                    key: Key("GiftMziPagehot"),
                    typeUrl: "hot",
                  ),
                  GiftMziPage(
                    key: Key("GiftMziPagetaiwan"),
                    typeUrl: "taiwan",
                  ),
                  GiftMziPage(
                    key: Key("GiftMziPagexinggan"),
                    typeUrl: "xinggan",
                  ),
                  GiftMziPage(
                    key: Key("GiftMziPagejapan"),
                    typeUrl: "japan",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
