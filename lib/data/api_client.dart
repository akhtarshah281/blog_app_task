import 'dart:io';

import 'package:blog_app_task/utils/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class ApiClient {
  Future<dynamic> registerUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Message.error((e as FirebaseAuthException).message!);
    }
  }

  Future<dynamic> saveRegisterationData(
      {required BuildContext context,
      required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    //creating Collection Reference
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    //setting data to specific user with their unique id's
    return users
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
          'firstName': firstName, // first name
          'lastName': lastName, // last name
          'email': email, // email
          'password': password, // password
          'imageURL': null, // imageURl null at first time of user registeration
        })
        .then((value) => Message.success('saved User Data Successfully'))
        .catchError((error) => Message.success('Could not add! $error'));
  }

  Future<dynamic> loginUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // return Message.success('logged in Successfully ');

    } catch (e) {
      return Message.error((e as FirebaseAuthException).message!);
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<dynamic> savePostsData({
    required BuildContext context,
    required String title,
    required String desc,
    required String imageURL,

  }) async {
    try {
      await FirebaseFirestore.instance.collection('posts').doc().set({
        'userId': FirebaseAuth.instance.currentUser!.uid,
        'title': title,
        'desc': desc,
        'imageUrl': imageURL,
      });
      Message.success('Post data Saved');
      // Utils.nextScreen(context: context, screenRouteName: HomeScreen.routeName);
    } catch (e) {
      Message.error('Failed to Add Post');
    }
  }
  Future<String> uploadPostImage(
      {required BuildContext context, required File postfile}) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref('/posts/${basename(postfile.path)}');
      //upload image
      UploadTask uploadTask = ref.putFile(postfile);
      TaskSnapshot taskSnapshot = await uploadTask;

      // Waits till the file is uploaded then stores the download url
      String url = await taskSnapshot.ref.getDownloadURL();
      return url;
    } catch (e) {
      return (e as FirebaseException).message.toString();
    }
  }

  Future<dynamic> getPostsData() async {
    try {
      CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('posts');

      // Get specific user posts from collection reference
      /// QuerySnapshot querySnapshot = await _collectionRef
      ///     .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      ///     .get();

      QuerySnapshot querySnapshot = await _collectionRef.get();
      return querySnapshot;
    } catch (e) {
      return (e as FirebaseException).message;
    }
  }
}
