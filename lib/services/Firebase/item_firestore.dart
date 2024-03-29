import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:graduation_project/Models/seller_model.dart';

import '../../models/buyer_model.dart';
import 'user_auth.dart';

class ItemFirestore extends ChangeNotifier {
  final CollectionReference _itemCollection =
      FirebaseFirestore.instance.collection('Items');
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  ItemModel? item;
  bool isLoading = false;
  String errorMessage = '';

  set setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  set setMessage(String value) {
    errorMessage = value;
    notifyListeners();
  }

  Future<void> addItem({
    price,
    description,
    title,
    image,
    sellerId,
  }) async {
    Map<String, dynamic> itemData = {
      'price': price,
      'description': description,
      'image': image,
      'sellerId': sellerId,
      'title': title,
    };
    DocumentReference docRef = await _itemCollection.add(itemData);
    String itemId = docRef.id;
    await _itemCollection.doc(itemId).update({'itemId': itemId});
  }

  Future<void> loadSellerData() async {
    final User user = UserAuth().currentUser;
    QuerySnapshot querySnapshot = await _itemCollection
        .where('email', isEqualTo: user.email)
        .limit(1)
        .get();
    item = ItemModel.fromMap(
        querySnapshot.docs.first.data() as Map<String, dynamic>);
    notifyListeners();
  }

  Future<void> updateSellerData(
      {bool? registered,
      String? path,
      bool? hasTeam,
      String? projectID,
      String? token,
      List<dynamic>? alerts,
      String? bio,
      List<dynamic>? canDo,
      List<dynamic>? chats}) async {
    final User user = UserAuth().currentUser;
    final docSnap = await _itemCollection
        .where('studentUID', isEqualTo: user.uid)
        .limit(1)
        .get();
    final doc = docSnap.docs.first;
    if (registered != null) {
      doc.reference.update({'registered': true});
    }
    if (path != null) {
      doc.reference.update({'profilePicture': path});
    }
    if (hasTeam != null) {
      doc.reference.update({'hasTeam': hasTeam});
    }
    if (projectID != null) {
      doc.reference.update({'projectID': projectID});
    }
    if (token != null) {
      doc.reference.update({'token': token});
    }
    if (alerts != null) {
      doc.reference.update({'alerts': alerts});
    }
    if (bio != null) {
      doc.reference.update({'bio': bio});
    }
    if (canDo != null) {
      doc.reference.update({'canDo': canDo});
    }
    if (chats != null) {
      doc.reference.update({'chats': chats});
    }
    loadSellerData();
  }

  Future<void> updateStudentByID(
      {required String? studentID,
      Map<dynamic, dynamic>? alert,
      List<dynamic>? chats,
      bool? hasTeam,
      String? projectID}) async {
    final docSnap = await _itemCollection
        .where('studentID', isEqualTo: studentID)
        .limit(1)
        .get();
    final doc = docSnap.docs.first;
    if (hasTeam != null) {
      doc.reference.update({'hasTeam': hasTeam});
    }
    if (projectID != null) {
      doc.reference.update({'projectID': projectID});
    }
    if (chats != null) {
      doc.reference.update({'chats': chats});
    }
  }

  Future<BuyerModel> getStudentByID({required studentID}) async {
    final querySnapshot = await _itemCollection
        .where('studentID', isEqualTo: studentID)
        .limit(1)
        .get();
    return BuyerModel.fromMap(
        querySnapshot.docs.first.data() as Map<String, dynamic>);
  }

//   // * Profile Image
//   final picker = ImagePicker();
//   XFile? _image;
//   XFile? get getImage => _image;

//   Future pickGalleryImage() async {
//     final pickedFile =
//         await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
//     if (pickedFile != null) {
//       _image = XFile(pickedFile.path);
//       uploadImage();
//     }
//   }

//   Future pickCameraImage() async {
//     final pickedFile =
//         await picker.pickImage(source: ImageSource.camera, imageQuality: 100);
//     if (pickedFile != null) {
//       _image = XFile(pickedFile.path);
//       uploadImage();
//     }
//   }

//   void uploadImage() async {
//     final User user = UserAuth().currentUser;
//     firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
//         .ref('/profileImage${user.uid}');
//     firebase_storage.UploadTask uploadTask =
//         ref.putFile(File(getImage!.path).absolute);
//     await Future.value(uploadTask);
//     final String newURL = await ref.getDownloadURL();
//     user.email?.contains('std') ?? false
//         ? updateStudentData(path: newURL)
//         : updateInstructorData(path: newURL);
//   }
}
