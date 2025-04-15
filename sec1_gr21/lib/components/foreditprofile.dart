import 'package:flutter/material.dart';

class Foreditprofile extends StatefulWidget {
  const Foreditprofile({
    Key? key,
  }) : super(key: key);

  @override
  _Foreditprofilestate createState() => _Foreditprofilestate();
}

class _Foreditprofilestate extends State<Foreditprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:
            true, // Allows the body to resize when keyboard appears

        body: SingleChildScrollView(
          // padding: const EdgeInsets.all(20.0),
          padding: const EdgeInsetsDirectional.symmetric(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    const CircleAvatar(
                      radius: 70,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.edit),
                        iconSize: 32,
                        onPressed: () {
                          // for edit photo
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                    width: 270,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ชื่อ',
                      // textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Container(
                    width: 270,
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "ชื่อ",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    )),
                const SizedBox(height: 10),
                Container(
                    width: 270,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Container(
                    width: 270,
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    )),
                const SizedBox(height: 10),
                Container(
                    width: 270,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'เบอร์โทรศัพท์',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Container(
                    width: 270,
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "เบอร์โทรศัพท์",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    )),
                const SizedBox(height: 10),
                Container(
                    width: 270,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Username',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Container(
                    width: 270,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        // label: Text('Username'),
                        hintText: "Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    )),
                const SizedBox(height: 10),
                Container(
                    width: 270,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Container(
                    width: 270,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    )),
                const SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      shape: StadiumBorder(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    ),
                    onPressed: () {
                      // Navigator.pushNamed(context, null);
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 20), // 👈 ช่องว่างระหว่างปุ่ม

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      shape: StadiumBorder(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    ),
                    onPressed: () {
                      // Navigator.pushNamed(context, null);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ])
              ],
            ),
          ),
        ));
  }
}
