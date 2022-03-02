import 'package:flutter/material.dart';
import 'package:flutter_workshop/professor_details_screen.dart';
import 'data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'CSE Department'),
      // home: Container(
      //   color: Colors.white,
      // ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: faculty.length,
          itemBuilder: (context, index) {
            String name = faculty.keys.elementAt(index);
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
                              builder: (context) => ProfessorDetail(
                                    name: name,
                                  ))),
                      child: Container(
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.redAccent),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.redAccent),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                faculty[name]!["pic"],
                                fit: BoxFit.fill,
                                width: 100,
                                height: 100,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(
                                  height: 18,
                                ),
                                Text(faculty[name]!["title"],
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
          }),
    );
  }
}
