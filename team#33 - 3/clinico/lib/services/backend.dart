import 'package:clinico/model/user.dart';
import 'package:clinico/pages/patientDashboard/hospitalCard.dart';
import 'package:clinico/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final CollectionReference doctorCollection =
    FirebaseFirestore.instance.collection('doctors');
final CollectionReference patientCollection =
    FirebaseFirestore.instance.collection('patients');

class Backend {
  Future<void> addDoctorInDataBase(Doctor doctor) async {
    await doctorCollection.doc(doctor.uid).set({
      "clinicName": doctor.clinicName,
      "educationalQualification": doctor.educationalQualification,
      "timing": doctor.timing,
      "address": doctor.address,
      "fee": doctor.fee,
      "paymentMethod": doctor.paymentMethod,
      "bio": doctor.bio,
      "displayName": doctor.displayName,
      "email": doctor.email,
      "photoURL": doctor.photoURL
    });
  }

  showAllHospitalCard() {
    return StreamBuilder(
        stream: doctorCollection.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Loading();
          }
          List<HospitalCard> allhospital = new List();
          snapshot.data.docs.forEach((doc) {
            allhospital.add(HospitalCard(
              doctor: Doctor(
                address: doc.data()["address"],
                bio: doc.data()["bio"],
                clinicName: doc.data()["clinicName"],
                displayName: doc.data()["displayName"],
                educationalQualification:
                    doc.data()["educationalQualification"],
                email: doc.data()["email"],
                fee: doc.data()["fee"],
                paymentMethod: doc.data()["paymentMethod"],
                photoURL: doc.data()["photoURL"],
                timing: doc.data()["timing"],
                uid: doc.data()["uid"],
              ),
            ));
          });
          return Column(children: allhospital);
        });
  }

  Future<void> AddPatient(MyUser user) async {
    await patientCollection.doc(user.uid).set({
      "name": user.displayName,
      "email": user.email,
      "photoURL": user.photoURL,
    });
  }
}
