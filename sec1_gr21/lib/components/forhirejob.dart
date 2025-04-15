import 'package:flutter/material.dart';
import 'package:sec1_gr21/theme/theme_manager.dart';

class Forhirejob extends StatefulWidget {
  const Forhirejob({
    Key? key,
  }) : super(key: key);

  @override
  State<Forhirejob> createState() => _Forhirejobstate();
}

class _Forhirejobstate extends State<Forhirejob> {
  final List<hirejobItem> forhirejob = [
    hirejobItem("หัตถกรรม", "สมชาย", 20, "บ้าน", "งานปั้น"),
    hirejobItem("งานฝีมือ", "สายใจ", 35, "ต่างจังหวัด", "ถักไหมพรม"),
    hirejobItem("งานช่าง", "วิชัย", 45, "เชียงใหม่", "ซ่อมเฟอร์นิเจอร์"),
  ];

  String searchText = "";

  @override
  Widget build(BuildContext context) {
    List<hirejobItem> filteredJobs = forhirejob
        .where((item) =>
            item.workname.contains(searchText) ||
            item.name.contains(searchText))
        .toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title + Add Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'จ้างงาน',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    iconSize: 32,
                    onPressed: () {
                      // Add new job
                      openDialog(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Search Field
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

              // Job Cards
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
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Left: Job info
                              Expanded(
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
                                    Text("ชื่อ: ${item.name}"),
                                    Text("อายุ: ${item.age}"),
                                    Text("ที่อยู่: ${item.location}"),
                                    Text("เพิ่มเติม: ${item.addition}"),
                                  ],
                                ),
                              ),

                              // Right: Icon
                              const Icon(
                                Icons.account_circle,
                                size: 100,
                                color: Colors.black54,
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          // Bottom right button
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                // ติดต่อ
                              },
                              child: const Text("ติดต่อ"),
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
          'หางาน',
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
                    'งานที่ต้องการทำ',
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
                      hintText: "งานที่ต้องการทำ",
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
                    'อายุ',
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
                    keyboardType:
                        TextInputType.number, // 📱 แสดงคีย์บอร์ดตัวเลข

                    decoration: InputDecoration(
                      hintText: "อายุ",
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
                    'ที่อยู่',
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
                      hintText: "ที่อยู่",
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

class hirejobItem {
  final String workname;
  final String name;
  final int age;
  final String location;
  final String addition;

  hirejobItem(this.workname, this.name, this.age, this.location, this.addition);
}
