import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sec1_gr21/components/appbar.dart';

import 'package:sec1_gr21/model/jobitem.dart';
import 'package:sec1_gr21/components/opendialogfindjob.dart';
import 'package:sec1_gr21/pages/contactpage.dart';

class FindJobPage extends StatefulWidget {
  const FindJobPage({Key? key}) : super(key: key);

  @override
  _FindJobPageState createState() => _FindJobPageState();
}

class _FindJobPageState extends State<FindJobPage> {
  String searchText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavBar(),
      body: Padding(
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
                  onPressed: () async {
                    final result = await openDialogfindjob(context);
                    if (result != null) {
                      FirebaseFirestore.instance
                          .collection("findjobs")
                          .add(result);
                    }
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
            // 🔥 ดึงข้อมูลจาก Firebase แบบ Real-time
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("findjobs")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError)
                    return Text("Error: ${snapshot.error}");
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  final docs = snapshot.data!.docs;
                  final filteredJobs = docs.where((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    final workname = data['workname'] ?? '';
                    final name = data['name'] ?? '';
                    return workname.contains(searchText) || //search
                        name.contains(searchText);
                  }).toList();

                  return ListView.builder(
                    itemCount: filteredJobs.length,
                    itemBuilder: (context, index) {
                      final data =
                          filteredJobs[index].data() as Map<String, dynamic>;

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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${data['workname'] ?? ''}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text("ชื่อ: ${data['name'] ?? ''}"),
                                          Text(
                                            "รูปแบบงาน: ${data['worktype'] == 'hourly' ? 'รายชั่วโมง' : 'รับเป็นงาน'}",
                                          ),
                                          if (data['worktype'] == 'hourly' &&
                                              data['minwage'] != null)
                                            Text(
                                                "รายได้ขั้นต่ำต่อชม: ${data['minwage']} บาท"),
                                          Text(
                                              "รายละเอียดเพิ่มเติม: ${data['addition'] ?? ''}"),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        const SizedBox(height: 8),
                                        const CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Colors.grey,
                                          child: Icon(Icons.account_circle,
                                              size: 50, color: Colors.white),
                                        ),
                                        FutureBuilder<DocumentSnapshot>(
                                            future: FirebaseFirestore.instance
                                                .collection("Users")
                                                .doc(data[
                                                    'userId']) // Using the userId from the post
                                                .get(),
                                            builder:
                                                (context, creatorSnapshot) {
                                              if (creatorSnapshot
                                                      .connectionState ==
                                                  ConnectionState.waiting) {
                                                return const Text(
                                                    "กำลังโหลดข้อมูลผู้สร้าง...");
                                              }
                                              if (creatorSnapshot.hasError) {
                                                return const Text(
                                                    "ไม่สามารถโหลดข้อมูลผู้สร้างได้");
                                              }
                                              final creatorData =
                                                  creatorSnapshot.data?.data()
                                                      as Map<String, dynamic>?;
                                              final creatorName =
                                                  creatorData?['name'] ??
                                                      'Unknown';

                                              return Column(children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text("ผู้สร้าง: $creatorName")
                                              ]);
                                            }),
                                        // Space between avatar and name
                                      ],
                                    ),
                                    // Creator info - Display the user who created the post
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () {
                                      // ติดต่อ รอสร้างหน้าใหม่
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Contactpage(
                                            userId: data[
                                                'userId'], // Pass the userId of the job poster
                                            userName: data[
                                                'name'], // Pass the name of the job poster
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text("ติดต่อ"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
