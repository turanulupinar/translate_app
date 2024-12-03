import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:translate_app/model/drawer_json_model/drawer_json_model.dart';

import 'package:translate_app/pages/star_save_page/star_save_page.dart';
import 'package:translate_app/pages/translate_page/translate_page.dart';
import 'package:translate_app/util/color_validator.dart';
import 'package:translate_app/util/textstyle_validator.dart';
import '../../model/drawer_json_model/drawer_json.dart';
import '../history_page/history_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _NaviBarState();
}

class _NaviBarState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  DrawerViewModel? model = DrawerViewModel.fromJson(drawerView);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: 125,
                width: 125,
                child: Image(
                  image: AssetImage(
                    model?.translateImage.toString() ?? "",
                  ),
                  color: ColorValidator().colValidator("orange"),
                )),
          ),
          ...List.generate(model?.drawerList?.length ?? 2, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, model?.drawerList?[index].route ?? "/homepage");
              },
              child: ListTile(
                leading: Icon(model?.drawerList?[index].icon),
                title: Text(
                  model?.drawerList?[index].title ?? "",
                  style: TextStyleValidator()
                      .getStyleValidator(fontName: "Medium", fontsize: 14),
                ),
                subtitle: Text(
                  model?.drawerList?[index].subtitle ?? "",
                  style: TextStyleValidator()
                      .getStyleValidator(fontName: "Regular", fontsize: 10),
                ),
              ),
            );
          }),
        ],
      )),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorValidator().colValidator("lightblue"),
        title: Text(
          "dil_cevirme",
          style: TextStyleValidator()
              .getStyleValidator(fontName: "Medium", fontsize: 22),
        ).tr(),
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.translate)),
            Tab(
              icon: Icon(Icons.history_sharp),
            ),
            Tab(icon: Icon(Icons.star)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          TranslatePage(),
          HistoryPage(),
          StarSavePage(),
        ],
      ),
    );
  }
}
