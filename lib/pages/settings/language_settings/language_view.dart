import 'package:financial_apps_prgi/pages/settings/language_settings/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageView extends GetView<LanguageSettingController> {
  const LanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Language".tr),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                GetBuilder<LanguageSettingController>(
                  init: LanguageSettingController(),
                  builder: (controller) {
                    return ListTile(
                      title: const Text("English"),
                      trailing: Radio(
                          value: controller.language[0],
                          groupValue: controller.selectLanguage,
                          onChanged: (value) {
                            controller.clickLanguage(value);
                          }),
                    );
                  },
                ),
                GetBuilder<LanguageSettingController>(
                  init: LanguageSettingController(),
                  builder: (controller) {
                    return ListTile(
                      title: const Text("华语简体"),
                      trailing: Radio(
                          value: controller.language[1],
                          groupValue: controller.selectLanguage,
                          onChanged: (value) {
                            controller.clickLanguage(value);
                          }),
                    );
                  },
                ),
                GetBuilder<LanguageSettingController>(
                  init: LanguageSettingController(),
                  builder: (controller) {
                    return ListTile(
                      title: const Text("華語繁體"),
                      trailing: Radio(
                          value: controller.language[2],
                          groupValue: controller.selectLanguage,
                          onChanged: (value) {
                            controller.clickLanguage(value);
                          }),
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