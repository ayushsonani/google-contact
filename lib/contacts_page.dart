import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:googlecontact/containers_in_contacts.dart';
import 'package:googlecontact/controler/hive_database.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  int select_body = 0;
  bool add_button_animation = false;
  List<BottomNavigationBarItem> bottom_items = [
    BottomNavigationBarItem(
      label: "Favourites",
      icon: Icon(Icons.star_border),
    ),
    BottomNavigationBarItem(
      label: "Recent",
      icon: Icon(Icons.access_time_sharp),
    ),
    BottomNavigationBarItem(
      label: "Contacts",
      icon: Icon(Icons.contacts),
    ),
  ];
  Box? box;

  insert_box() async {
    return box = await Hive.openBox("contect");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    insert_box();
  }

  TextEditingController Name_ = TextEditingController();
  TextEditingController Number_ = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Search Contacts and places "),
          leading: Icon(Icons.search),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.mic_rounded,
                )),
            PopupMenuButton(
              itemBuilder: (context) {
                return [PopupMenuItem(child: Text("add contects"))];
              },
            ),
          ],
        ),
        body: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.2,
                    child: FutureBuilder(
                      future: insert_box(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return ListView.builder(
                            itemCount: box!.length ?? 0,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.red,
                                ),
                                subtitle: Text("${box?.getAt(index).number}"),
                                title: Text("${box!.getAt(index).name}"),
                                trailing: Wrap(children: [
                                  IconButton(
                                      onPressed: () {
                                        box!.deleteAt(index);
                                        setState(() {

                                        });
                                      },
                                      icon: Icon(Icons.delete)),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(context: context, builder: (context) {
                                          return Update_Contacts_dialog(index);
                                        },);
                                        setState(() {

                                        });
                                      },
                                      icon: Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () async {
                                        await FlutterPhoneDirectCaller.callNumber("+91${box!.getAt(index).number}");
                                        setState(() {

                                        });
                                      },
                                      icon: Icon(Icons.call)),
                                ]),
                              );
                            },
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.2,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Text("hi");
                        // return ListTile(
                        //   leading: Text("${index + 1}"),
                        //   title: Row(
                        //     children: [
                        //       CircleAvatar(
                        //         backgroundColor: Colors.red,
                        //       ),
                        //       SizedBox(
                        //         width: 15,
                        //       ),
                        //       Container(
                        //           alignment: Alignment.center,
                        //           child: Text("data"))
                        //     ],
                        //   ),
                        // );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.2,
                    child: FutureBuilder(
                      future: insert_box(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return ListView.builder(
                            itemCount: box!.length ?? 0,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.red,
                                ),
                                subtitle: Text("${box?.getAt(index).number}"),
                                title: Text("${box!.getAt(index).name}"),
                                trailing: Wrap(children: [
                                  IconButton(
                                      onPressed: () {
                                        box!.deleteAt(index);
                                        setState(() {

                                        });
                                      },
                                      icon: Icon(Icons.delete)),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(context: context, builder: (context) {
                                          return Update_Contacts_dialog(index);
                                        },);
                                        setState(() {

                                        });
                                      },
                                      icon: Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () async {
                                        await FlutterPhoneDirectCaller.callNumber("+91${box!.getAt(index).number}");
                                        setState(() {

                                        });
                                      },
                                      icon: Icon(Icons.call)),
                                ]),
                              );
                            },
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ][select_body],
        floatingActionButton: Wrap(
          alignment: WrapAlignment.end,
          children: [
            add_button_animation
                ? FloatingActionButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Add_Contacts_dialog();
                        },
                      );
                    },
                    child: Icon(Icons.add))
                : Container(),
            FloatingActionButton(
              onPressed: () async {
                add_button_animation = true;

                // await Future.delayed(Duration(seconds: 5));
                setState(() {});
                select_body = 1;
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return dialenumber();
                  },
                );
                setState(() {});
              },
              child: Icon(Icons.dialpad),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              select_body = value;
              setState(() {});
            },
            currentIndex: select_body,
            items: bottom_items),
      ),
    );
  }

  Widget dialenumber() {
    return StatefulBuilder(
      builder: (context, setState1) {
        return Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: ListTile(
                    title: Container(
                        alignment: Alignment.center,
                        child: Text("${InsertNumber.number}")),
                    trailing: IconButton(
                        onPressed: () {
                          if (InsertNumber.number.isNotEmpty) {
                            InsertNumber.number = InsertNumber.number
                                .substring(0, InsertNumber.number.length - 1);
                          }
                          setState(() {});
                          setState1(() {});
                        },
                        icon: Icon(Icons.arrow_back))),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.width / 1.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: InkWell(
                                  onTap: () {
                                    InsertNumber.number =
                                        InsertNumber.number + "1";
                                    setState(() {});
                                    setState1(() {});
                                  },
                                  child: InsertNumber(1, "~"))),
                          Expanded(
                              child: InkWell(
                                  onTap: () {
                                    InsertNumber.number =
                                        InsertNumber.number + "2";
                                    setState(() {});
                                    setState1(() {});
                                  },
                                  child: InsertNumber(2, "ABC"))),
                          Expanded(
                              child: InkWell(
                                  onTap: () {
                                    InsertNumber.number =
                                        InsertNumber.number + "3";
                                    setState(() {});
                                    setState1(() {});
                                  },
                                  child: InsertNumber(3, "DEF"))),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: InkWell(
                                  onTap: () {
                                    InsertNumber.number =
                                        InsertNumber.number + "4";
                                    setState(() {});
                                    setState1(() {});
                                  },
                                  child: InsertNumber(4, "GHI"))),
                          Expanded(
                              child: InkWell(
                                  onTap: () {
                                    InsertNumber.number =
                                        InsertNumber.number + "5";
                                    setState(() {});
                                    setState1(() {});
                                  },
                                  child: InsertNumber(5, "JKL"))),
                          Expanded(
                              child: InkWell(
                                  onTap: () {
                                    InsertNumber.number =
                                        InsertNumber.number + "6";
                                    setState(() {});
                                    setState1(() {});
                                  },
                                  child: InsertNumber(6, "MNO"))),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: InkWell(
                                  onTap: () {
                                    InsertNumber.number =
                                        InsertNumber.number + "7";
                                    setState(() {});
                                    setState1(() {});
                                  },
                                  child: InsertNumber(7, "PQRS"))),
                          Expanded(
                              child: InkWell(
                                  onTap: () {
                                    InsertNumber.number =
                                        InsertNumber.number + "8";
                                    setState(() {});
                                    setState1(() {});
                                  },
                                  child: InsertNumber(8, "TUV"))),
                          Expanded(
                              child: InkWell(
                                  onTap: () {
                                    InsertNumber.number =
                                        InsertNumber.number + "9";
                                    setState(() {});
                                    setState1(() {});
                                  },
                                  child: InsertNumber(9, "WXYZ"))),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: InkWell(
                                  onTap: () {
                                    InsertNumber.number =
                                        InsertNumber.number + "0";
                                    setState(() {});
                                    setState1(() {});
                                  },
                                  child: InsertNumber(0, "+"))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: ElevatedButton(
                    onPressed: () async {
                      print(InsertNumber.number);
                      FlutterPhoneDirectCaller.callNumber(
                          "+91${InsertNumber.number}");
                      setState1(() {});
                    },
                    child: Text("call")))
          ],
        );
      },
    );
  }

  Widget Add_Contacts_dialog() {
    return AlertDialog(
      content: Container(
        height: MediaQuery.of(context).size.height / 3.5,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Enter a Name"),
              controller: Name_,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Enter a Number"),
              controller: Number_,
              keyboardType: TextInputType.number,
            )
          ],
        ),
      ),
      actions: [
        ElevatedButton(
            onPressed: () async {
              contect_data x = contect_data(Name_.text, Number_.text);
              await box?.add(x);
              Name_.clear();
              Number_.clear();
              print(x);
              Navigator.pop(context);
            },
            child: Text("add"))
      ],
    );
  }
  Widget Update_Contacts_dialog(int index) {
    contect_data x = box!.getAt(index);
    Name_.text = x.name!;
    Number_.text = x.number!;
    return AlertDialog(

      content: Container(
        height: MediaQuery.of(context).size.height / 3.5,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Enter a Name"),
              controller: Name_,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Enter a Number"),
              controller: Number_,
              keyboardType: TextInputType.number,
            )
          ],
        ),
      ),
      actions: [
        ElevatedButton(
            onPressed: () async {

              x.number = Number_.text;
              x.name = Name_.text;
              x.save();
              Name_.clear();
              Number_.clear();
              print(x);
              Navigator.pop(context);
            },
            child: Text("Update"))
      ],
    );
  }
}
