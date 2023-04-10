import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constans.dart';
import 'package:get/get.dart';

import 'coursera_card.dart';

class Coursera extends StatefulWidget {
  const Coursera({super.key});

  @override
  State<Coursera> createState() => _CourseraState();
}

class _CourseraState extends State<Coursera> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: Get.width,
        height: 200,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('coursera').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: streamSnapshot.data!.docs.length > 3
                      ? 3
                      : streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CourseraCard(
                            namesurname: documentSnapshot['name'],
                            link: documentSnapshot['odevLink'],
                            modulAdi: documentSnapshot['odevBaslik'],
                            backgroundColor: kGoogleBlue,
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class CourseraManager extends StatelessWidget {
  String name;
  String message;

  CourseraManager({required this.name, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: kGoogleBlue,
          ),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white),
      width: 250,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message,
              style: TextStyle(fontFamily: 'VarelaRound', color: Colors.black),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(fontFamily: 'VarelaRound', color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
