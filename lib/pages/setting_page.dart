import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mendeleev_table_api/pages/language_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF082032),
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text(
          "str_settings".tr(),
          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ).tr(),
      ),
      body: Container(
        child: Column(
          children: [

            //Language
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30),
              child: TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LanguagePage(),));
                },
                child: Row(
                  children: [
                    Icon(Icons.language, color: Colors.white, size: 40,),
                    SizedBox(width: 20,),
                    Text(
                      "str_language".tr(),
                      style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                    ).tr()
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20,),

            //About us
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30),
              child: TextButton(
                onPressed: (){},
                child: Row(
                  children: [
                    Icon(Icons.account_box, color: Colors.white, size: 40,),
                    SizedBox(width: 20,),
                    Text(
                      "str_about-us".tr(),
                      style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                    ).tr()
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20,),

            //Help
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30),
              child: TextButton(
                onPressed: (){},
                child: Row(
                  children: [
                    Icon(Icons.help, color: Colors.white, size: 40,),
                    SizedBox(width: 20,),
                    Text(
                      "str_help".tr(),
                      style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                    ).tr()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
