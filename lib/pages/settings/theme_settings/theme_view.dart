import 'package:financial_apps_prgi/pages/settings/theme_settings/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeView extends GetView<ThemeSettingController> {
  const ThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Theme".tr),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                GetBuilder<ThemeSettingController>(
                  init: ThemeSettingController(),
                  builder: (controller) {
                    return ListTile(
                      title: Text("Dark_Theme".tr, style: const TextStyle(fontSize: 18)),
                      subtitle: Text("Dark_Theme_Desciption".tr,
                          style: const TextStyle(fontSize: 14)),
                      trailing: Radio(
                        activeColor: Colors.blue[200],
                        value: true,
                        groupValue: controller.isDarkMode,
                        onChanged: (value) {
                          controller.chooseLightTheme(value);
                        },
                      ),
                    );
                  },
                ),
                GetBuilder<ThemeSettingController>(
                  init: ThemeSettingController(),
                  builder: (controller) {
                    return ListTile(
                      title: Text("Light_Theme".tr, style: const TextStyle(fontSize: 18)),
                      subtitle: Text("Light_Theme_Desciption".tr,
                          style: const TextStyle(fontSize: 14)),
                      trailing: Radio(
                        activeColor: Colors.blue[200],
                        value: false,
                        groupValue: controller.isDarkMode,
                        onChanged: (value) {
                          controller.chooseLightTheme(value);
                        },
                      ),
                    );
                  },
                ),
                // GetBuilder<SettingsController>(
                //   init: SettingsController(),
                //   builder: (controller) {
                //     return ListTile(
                //       title: Text("System Default",
                //           style: TextStyle(fontSize: 18)),
                //       subtitle: Text(
                //           "The primary color will base on system theme",
                //           style: TextStyle(fontSize: 14)),
                //       trailing: Radio(
                //         activeColor: Colors.red[200],
                //         value: null,
                //         groupValue: false,
                //         onChanged: (value) {
                //           // controller.onClickRadioButton(value);
                //         },
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}