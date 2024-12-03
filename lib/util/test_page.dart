import 'package:flutter/material.dart';

import 'package:translate_app/model/post_translate_model.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  PostTranslateModel? translatedModel;

  @override
  void initState() {
    super.initState();
  }

  initdata() async {}

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
          // children: [ElevatedButton(onPressed: getonline, child: Text("asd"))],
          ),
    );
  }
}
