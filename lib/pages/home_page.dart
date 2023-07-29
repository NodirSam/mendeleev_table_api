import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mendeleev_table_api/pages/setting_page.dart';
import '../models/users_pets.dart';
import 'details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ElementInfo usersPets;

  bool isLoading = false;

  String errorMsg = "";

  Future<ElementInfo> getDataFromApi() async {
    Uri url = Uri.parse(
        "https://99dc9dc3-e243-4c15-8fc7-84de1ef3eba9.mock.pstmn.io/elements");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      ElementInfo usersPets = elementInfoFromJson(response.body);
      return usersPets;
    } else {
      errorMsg = "${response.statusCode} : ${response.body}";
      return ElementInfo(elements: []);
    }
  }

  assignData() async {
    usersPets = await getDataFromApi();
    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assignData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF082032),
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.black12,
        title: const Text(
          "Periodic Table",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage(),));
              },
              icon: const Icon(Icons.menu),
            ),
          ),
        ],

      ),
      body: !isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : errorMsg.isNotEmpty
          ? Center(
        child: Text(errorMsg),
      )
          : usersPets.elements.isEmpty
          ? const Center(child: Text("No data"))
          : SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: double.infinity,
          height: 900,
          child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 2),
          child: GridView.builder(
            padding: const EdgeInsets.only(
                left: 3, bottom: 30, right: 3),
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 10,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: 180,
            itemBuilder: (context, index) {
              for (var j = 0; j < 119; j++) {
                if (((usersPets.elements[j].ypos! - 1) +
                    (usersPets.elements[j].xpos! - 1) * 10) == index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(
                                milliseconds: 400),
                            transitionsBuilder:
                                (BuildContext context,
                                Animation<double> _anim,
                                Animation<double> _anim2,
                                Widget child) {
                              _anim = CurvedAnimation(
                                  parent: _anim,
                                  curve: Curves.fastOutSlowIn);
                              return ScaleTransition(
                                scale: _anim,
                                child: child,
                              );
                            },
                            pageBuilder: (BuildContext context,
                                Animation<double> _anim,
                                Animation<double> _anim2) {
                              return Details(j, usersPets.elements);
                            },
                          ),
                      );
                    },
                    child: Hero(
                      tag: "$j",
                      child: Card(
                        color: usersPets.elements[j].category ==
                            "diatomic nonmetal"
                            ? Colors.redAccent
                            : usersPets.elements[j].category == "alkali metal"
                            ? Colors.lightBlue
                            : usersPets.elements[j].category ==
                            "unknown, but predicted to be an alkali metal"
                            ? Colors.lightGreen
                            : usersPets.elements[j].category ==
                            "alkaline earth metal"
                            ? Colors.yellow[800]
                            : usersPets.elements[j].category ==
                            "transition metal"
                            ? Colors.teal
                            : usersPets.elements[j].category == "lanthanide"
                            ? Colors.pinkAccent
                            : usersPets.elements[j].category == "actinide"
                            ? Colors.purpleAccent
                            : usersPets.elements[j].category == "metalloid"
                            ? Colors.grey[700]
                            : usersPets.elements[j].category ==
                            "post-transition metal"
                            ? Colors.orange[200]
                            : usersPets.elements[j].category ==
                            "polyatomic nonmetal"
                            ? Colors.amber
                            : usersPets.elements[j].category == "noble gas"
                            ? Colors.green[800]
                            : usersPets.elements[j].category ==
                            "unknown, probably transition metal"
                            ? Colors.indigo
                            : usersPets.elements[j].category ==
                            "unknown, probably post-transition metal"
                            ? Colors.deepPurpleAccent
                            : usersPets.elements[j].category ==
                            "unknown, probably metalloid"
                            ? Colors.blue[300]
                            : usersPets.elements[j].category ==
                            "unknown, predicted to be noble gas"
                            ? Colors.brown[500]
                            : Colors.deepOrangeAccent,

                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(padding: const EdgeInsets.only(
                                top: 2, left: 3,),
                                  child: Text("${usersPets.elements[j].number}",
                                    style: TextStyle(fontSize: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .fontSize, color: Colors.white),)),
                              Container(padding: const EdgeInsets.only(
                                top: 2, left: 25,),
                                  child: Text(
                                    usersPets.elements[j].symbol.toString(),
                                    style: const TextStyle(
                                        fontSize: 24, color: Colors.white),)),
                              Container(padding: const EdgeInsets.only(
                                top: 2, left: 5,),
                                  child: FittedBox(child: Text(
                                    usersPets.elements[j].nameUz.toString(),
                                    style: TextStyle(fontSize: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .fontSize, color: Colors.white),))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              }
              return Container(
                height: 80,
                width: 80,
                //color: Colors.white,
              );
            },
          ),
        ),
      ),
    ),);
  }
}
