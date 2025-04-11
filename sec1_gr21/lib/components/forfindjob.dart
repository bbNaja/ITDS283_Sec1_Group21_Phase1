import 'package:flutter/material.dart';
import 'package:sec1_gr21/theme/theme_manager.dart';

class Forfindjob extends StatefulWidget {
  final ThemeManager themeManager;

  const Forfindjob({
    Key? key,
    required this.themeManager,
  }) : super(key: key);

  @override
  State<Forfindjob> createState() => _Forfindjobstate();
}

class _Forfindjobstate extends State<Forfindjob> {
  final List<findjobItem> Forfindjob = [
    findjobItem("ศิลปะ", "david", "เพิ่มเติม", "test"),
    findjobItem("งานฝีมือ", "david", "ถักไหมพรม", "test"),
    findjobItem("test", "david", "เพิ่มเติม", "test"),
    findjobItem("test", "david", "เพิ่มเติม", "test"),
  ];

  String searchText = "";
  @override
  Widget build(BuildContext context) {
    List<findjobItem> filteredJobs = Forfindjob.where((item) =>
        item.workname.contains(searchText) ||
        item.name.contains(searchText)).toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // หัวข้อ + ปุ่มเพิ่ม
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'หางาน',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons
                        .add_circle_outline), // กดปุ่มเพิ่มเพื่อให้ไปเพิ่มใน list ข้างบน
                    iconSize: 32,
                    onPressed: () {
                      // เพิ่มงานใหม่
                      openDialog(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Search box
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 20),
              ...filteredJobs.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${item.workname}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text("ชื่อผู้จ้าง: ${item.name}"),
                          Text("ที่ทำงาน: ${item.location}"),
                          Text("เพิ่มเติม: ${item.addition}"),
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                // กดสนใจ
                              },
                              child: const Text("สนใจ"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

Future openDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'เพิ่มงาน',
          // textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: 270,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ชื่องาน',
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
                      hintText: "ชื่องาน",
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
                    'ชื่องาน',
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
                      hintText: "ชื่อผู้จ้าง",
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
                    'ชื่อผู้จ้าง',
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
                      hintText: "ชื่อผู้จ้าง",
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
                    'สถานที่ทำงาน',
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
                      hintText: "สถานที่ทำงาน",
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
                    'รายละเอียดเพิ่มเติม',
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
                      hintText: "รายละเอียดเพิ่มเติม",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  )),
            ],
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        actions: [
          TextButton(onPressed: () {}, child: Text('ส่ง')),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('ยกเลิก'),
          ),
        ],
      ),
    );

class findjobItem {
  final String name;
  final String workname;
  final String location;
  final String addition;

  findjobItem(this.workname, this.name, this.location, this.addition);
}
