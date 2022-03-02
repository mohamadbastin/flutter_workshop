import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_workshop/data_provider.dart';
import 'package:flutter_workshop/professor_details_online.dart';
import 'package:flutter_workshop/professor_details_screen.dart';

class MyHomePageOnline extends StatefulWidget {
  const MyHomePageOnline({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePageOnline> createState() => _MyHomePageOnlineState();
}

class _MyHomePageOnlineState extends State<MyHomePageOnline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: DataProvider.getFaculties(),
          builder: (context, AsyncSnapshot<List> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    // String name = snapshot.data!.elementAt(index);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProfessorDetailOnline(
                                            id: snapshot.data![index]["id"],
                                          ))),
                              child: Container(
                                decoration: BoxDecoration(
                                    // border: Border.all(color: Colors.redAccent),
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.redAccent),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.asset(
                                        snapshot.data![index]!["pic"],
                                        fit: BoxFit.fill,
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(snapshot.data![index]!["name"],
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500)),
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        Text(snapshot.data![index]!["title"],
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500))
                                      ],
                                    ),
                                    const Center(
                                      child: Icon(Icons.arrow_forward_ios),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.black,
                            thickness: 2,
                          )
                        ],
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              log("${snapshot.error}", name: "ERROR");
              return const Center(
                child: Text("error"),
              );
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
