import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/users_pets.dart' as UsersPets;

class Details extends StatefulWidget {
  final int index;
  final  List<UsersPets.Element> elements;
  const Details(this.index, this.elements);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  late UsersPets.ElementInfo usersPets;
  @override
  void initState() {
    usersPets = UsersPets.ElementInfo(elements: widget.elements);
    super.initState();
    isLoading = true;
  }
  bool isLoading = false;

  String errorMsg = "";
  //
  // Future<ElementInfo> getDataFromApi() async {
  //   Uri url = Uri.parse(
  //       "https://99dc9dc3-e243-4c15-8fc7-84de1ef3eba9.mock.pstmn.io/elements");
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     ElementInfo usersPets = elementInfoFromJson(response.body);
  //     return usersPets;
  //   } else {
  //     errorMsg = "${response.statusCode} : ${response.body}";
  //     return ElementInfo(elements: []);
  //   }
  // }
  //
  // assignData() async {
  //   usersPets = await getDataFromApi();
  //   setState(() {
  //     isLoading = true;
  //   });
  // }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   assignData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF082032),
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text("Element Details"),
      ),
      body: !isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : errorMsg.isNotEmpty
          ? Center(
        child: Text(errorMsg),
      )
          : usersPets.elements.isEmpty
          ? Center(child: Text("No data"))
          : Center(
        child: Hero(
          tag: "${widget.index}",
          child: Card(
            color: usersPets.elements[widget.index].category == "diatomic nonmetal"
                ? Colors.redAccent
                : usersPets.elements[widget.index].category == "alkali metal"
                ? Colors.lightBlue
                : usersPets.elements[widget.index].category == "unknown, but predicted to be an alkali metal"
                ? Colors.lightGreen
                : usersPets.elements[widget.index].category == "alkaline earth metal"
                ? Colors.yellow[800]
                : usersPets.elements[widget.index].category == "transition metal"
                ? Colors.teal
                : usersPets.elements[widget.index].category == "lanthanide"
                ? Colors.pinkAccent
                : usersPets.elements[widget.index].category == "actinide"
                ? Colors.purpleAccent
                : usersPets.elements[widget.index].category == "metalloid"
                ? Colors.grey[700]
                : usersPets.elements[widget.index].category == "post-transition metal"
                ? Colors.orange[200]
                : usersPets.elements[widget.index].category == "polyatomic nonmetal"
                ? Colors.amber
                : usersPets.elements[widget.index].category == "noble gas"
                ? Colors.green[800]
                : usersPets.elements[widget.index].category == "unknown, probably transition metal"
                ? Colors.indigo
                : usersPets.elements[widget.index].category == "unknown, probably post-transition metal"
                ? Colors.deepPurpleAccent
                : usersPets.elements[widget.index].category == "unknown, probably metalloid"
                ? Colors.blue[300]
                : usersPets.elements[widget.index].category == "unknown, predicted to be noble gas"
                ? Colors.brown[500]
                : Colors.deepOrangeAccent,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //NAME
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 30, left: 10),
                          //height: 100,
                          child: Text(
                            "Name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, bottom: 10),
                          child: Text(
                            usersPets.elements[widget.index].nameRu.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.black38,
                      height: 2,
                      indent: 10,
                      endIndent: 10,
                      thickness: 3,
                    ),

                    //SYMBOL
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          //height: 100,
                          child: Text(
                            "Symbol",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, bottom: 10),
                          child: Text(
                            usersPets.elements[widget.index].symbol.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.black38,
                      height: 2,
                      indent: 10,
                      endIndent: 10,
                      thickness: 3,
                    ),

                    //ATOMIC NUMBER
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          //height: 100,
                          child: Text(
                            "Atomic Number",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, bottom: 10),
                          child: Text(
                            usersPets.elements[widget.index].number.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.black38,
                      height: 2,
                      indent: 10,
                      endIndent: 10,
                      thickness: 3,
                    ),

                    //ATOMIC MASS
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          //height: 100,
                          child: Text(
                            "Atomic mass",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, bottom: 10),
                          child: Text(
                            usersPets.elements[widget.index].atomicMass.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.black38,
                      height: 2,
                      indent: 10,
                      endIndent: 10,
                      thickness: 3,
                    ),

                    //CATEGORY
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          //height: 100,
                          child: Text(
                            "Category",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, bottom: 10),
                          child: Text(
                            usersPets.elements[widget.index].category.toString().toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.black38,
                      height: 2,
                      indent: 10,
                      endIndent: 10,
                      thickness: 3,
                    ),

                    //Summary
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          //height: 100,
                          child: Text(
                            "Summary",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, bottom: 10),
                          child: Text(
                            usersPets.elements[widget.index].summary.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),

                    const Divider(
                      color: Colors.black38,
                      height: 2,
                      indent: 10,
                      endIndent: 10,
                      thickness: 3,
                    ),

                    //Group, Period
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 5, left: 10),
                              //height: 100,
                              child: Text(
                                "Group:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .fontSize,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 14, left: 5, bottom: 10),
                              child: Text(
                                usersPets.elements[widget.index].xpos.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .fontSize,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20,),

                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 5, left: 10),
                              //height: 100,
                              child: Text(
                                "Period:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .fontSize,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 14, left: 5, bottom: 10),
                              child: Text(
                                usersPets.elements[widget.index].ypos.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .fontSize,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     Container(
                        //       padding: const EdgeInsets.only(top: 20, left: 10),
                        //       //height: 100,
                        //       child: Text(
                        //         "Group",
                        //         style: TextStyle(
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: Theme.of(context)
                        //                 .textTheme
                        //                 .titleLarge!
                        //                 .fontSize,
                        //             color: Colors.black),
                        //       ),
                        //     ),
                        //     Container(
                        //       padding: const EdgeInsets.only(
                        //           top: 5, left: 10, bottom: 10),
                        //       child: Text(
                        //         usersPets.elements[widget.index].xpos.toString(),
                        //         style: TextStyle(
                        //             fontWeight: FontWeight.w500,
                        //             fontSize: Theme.of(context)
                        //                 .textTheme
                        //                 .titleLarge!
                        //                 .fontSize,
                        //             color: Colors.black),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     Container(
                        //       padding: const EdgeInsets.only(top: 20, left: 10),
                        //       //height: 100,
                        //       child: Text(
                        //         "Period",
                        //         style: TextStyle(
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: Theme.of(context)
                        //                 .textTheme
                        //                 .titleLarge!
                        //                 .fontSize,
                        //             color: Colors.black),
                        //       ),
                        //     ),
                        //     Container(
                        //       padding: const EdgeInsets.only(
                        //           top: 5, left: 10, bottom: 10),
                        //       child: Text(
                        //         usersPets.elements[widget.index].ypos.toString(),
                        //         style: TextStyle(
                        //             fontWeight: FontWeight.w500,
                        //             fontSize: Theme.of(context)
                        //                 .textTheme
                        //                 .titleLarge!
                        //                 .fontSize,
                        //             color: Colors.black),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                    // const Divider(
                    //   color: Colors.black38,
                    //   height: 2,
                    //   indent: 10,
                    //   endIndent: 10,
                    //   thickness: 3,
                    // ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}
