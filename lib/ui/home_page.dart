import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist2/services/notification_services.dart';
import 'package:todolist2/services/themeService.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: const Column(
        children: [
          Text("Theme data",
          style: TextStyle(
            fontSize: 30
          ),
          )
        ],
      ),
    );
  }
  _appBar(){
  return AppBar(
    
    leading: GestureDetector(
      onTap: (){
        ThemeService().switchTheme();
        notifyHelper.displayNotification(
          title: "Theme Changed",
          body: Get.isDarkMode?"Activated Light Theme":"Activated Dark Theme"
        );

        notifyHelper.scheduledNotification();
      },
      child: Icon(Icons.nightlight_round,
        size: 20,),
    ),
    actions: [
      Icon(Icons.person,
        size: 20,),
      SizedBox(width: 20,),
    ],
  );
}
}
