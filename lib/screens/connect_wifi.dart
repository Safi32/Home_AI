import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:home_ai/widgets/title_subtitle_widget.dart';
import 'package:home_ai/widgets/wifi_connect_dialog.dart';
import 'package:home_ai/widgets/wifi_widget.dart';

class ConnectWifi extends StatelessWidget {
  const ConnectWifi({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back, color: Colors.black),
                ),
                SizedBox(height: 20),
                TitleSubtitleWidget(
                  title: "Connect To Wi-Fi",
                  subtitle: "Select the network you want your camera to use",
                ),
                SizedBox(height: 40),
                WifiWidget(
                  text: "Home",
                  color: Colors.black,
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (_) => const WifiConnectDialog(),
                    );
                  },
                ),
                SizedBox(height: 10),
                WifiWidget(
                  text: "Home",
                  color: Colors.grey,
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (_) => const WifiConnectDialog(),
                    );
                  },
                ),
                SizedBox(height: 10),
                WifiWidget(text: "Home", color: Colors.grey,
                 onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (_) => const WifiConnectDialog(),
                    );
                  },
                ),
                SizedBox(height: 10),
                WifiWidget(text: "Home", color: Colors.black,
                 onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (_) => const WifiConnectDialog(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
