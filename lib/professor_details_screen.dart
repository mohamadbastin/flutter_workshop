import 'package:flutter/material.dart';
import 'data.dart';

class ProfessorDetail extends StatelessWidget {
  const ProfessorDetail({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  faculty[name]!["pic"],
                  fit: BoxFit.fill,
                  width: 200,
                  height: 200,
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(faculty[name]!["title"],
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500))
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Subject Groups:",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.purpleAccent),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(faculty[name]!["subject groups"],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Research interests:",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.purpleAccent),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(faculty[name]!["Research interests"],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "email:",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.purpleAccent),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(faculty[name]!["email"],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
