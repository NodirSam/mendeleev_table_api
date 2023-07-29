import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mendeleev_table_api/models/loading.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {

  //bool Language_change = Loading(loading_en: false, loading_ru: false, loading_uz: false) as bool;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          "str_language".tr(),
          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ).tr(),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30),
              child: TextButton(
                onPressed: (){
                  setState(() {

                  });
                  context.setLocale(const Locale('en', 'US'));
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => LanguagePage(),));
                },
                child: Row(
                  children:[
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Image.asset("assets/images/en.png"),
                    ),
                    //Icon(Icons.language, color: Colors.white, size: 40,),
                    const SizedBox(width: 20,),
                    Text(
                      "str_english".tr(),
                      style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                    ).tr()
                  ],
                ),
              ),
            ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30),
              child: TextButton(
                onPressed: (){
                  context.setLocale(const Locale('ru', 'RU'));
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => LanguagePage(),));
                },
                child: Row(
                  children:[
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Image.asset("assets/images/ru.png"),
                    ),
                    //Icon(Icons.language, color: Colors.white, size: 40,),
                    const SizedBox(width: 20,),
                     Text(
                      "str_russian".tr(),
                      style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                    ).tr()
                  ],
                ),
              ),
            ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30),
              child: TextButton(
                onPressed: (){
                  context.setLocale(const Locale('uz', 'UZ'));
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => LanguagePage(),));
                },
                child: Row(
                  children:[
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Image.asset("assets/images/uz.png"),
                    ),
                    //Icon(Icons.language, color: Colors.white, size: 40,),
                    const SizedBox(width: 20,),
                    Text(
                      "str_uzbek".tr(),
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
