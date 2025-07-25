// import 'dart:typed_data';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:insta/models/post.dart';
// import 'package:insta/resources/storageMethod.dart';
// import 'package:uuid/uuid.dart';
//
// class FirestoreMethods{
//   static final  FirebaseFirestore firestore=FirebaseFirestore.instance;
//   Future<String>UploadPost (
//       String uid,
//       String discription,
//       Uint8List file,
//       String username,
//       String profileUrl,
//       ) async {
//     String res ='Some error occurred';
//     try{
//       String photoUrl = await StorageMethod().uploadImageToStorage('post', file, true);
//       String postId = const Uuid().v1();
//       Post post = Post(
//         description: discription ,
//         uid: uid,
//         username: username,
//         postId: postId,
//         datePublished: DateTime.now(),
//         postUrl: photoUrl,
//         profileUrl: profileUrl,
//         likes: [],
//       );
//
//       firestore.collection('posts').doc(postId).set(post.toJson(),);
//       res='Success';
//
//     }catch(err){
//       res=err.toString();
//     }
//     return res;
//   }
//
//
//   Future<void>likePost(String postId,String uid , List likes)async {
//     try{
//
//       if (likes.contains(uid)) {
//         await firestore.collection('posts').doc(postId).update({
//           'likes': FieldValue.arrayRemove([uid])
//         });
//       } else {
//         await firestore.collection('posts').doc(postId).update({
//           'likes': FieldValue.arrayUnion([uid])
//         });
//       }
//
//     }catch(err){
//       if (kDebugMode) {
//         print(err.toString());
//       }
//     }
//
//   }
//
//
//
//   Future<String> postComment(String postId, String text, String uid,
//       String name, String profilePic) async {
//     String res = "Some error occurred";
//     try {
//       if (text.isNotEmpty) {
//         // if the likes list contains the user uid, we need to remove it
//         String commentId = const Uuid().v1();
//         firestore
//             .collection('posts')
//             .doc(postId)
//             .collection('comments')
//             .doc(commentId)
//             .set({
//           'profilePic': profilePic,
//           'name': name,
//           'uid': uid,
//           'text': text,
//           'commentId': commentId,
//           'datePublished': DateTime.now(),
//         });
//         res = 'success';
//       } else {
//         res = "Please enter text";
//       }
//     } catch (err) {
//       res = err.toString();
//     }
//     return res;
//   }
//
//   Future<String> deletePost(String postId) async {
//     String res = "Some error occurred";
//     try {
//       await firestore.collection('posts').doc(postId).delete();
//       res = 'success';
//     } catch (err) {
//       res = err.toString();
//     }
//     return res;
//   }
//
//   Future<void> followUser(
//       String uid,
//       String followId
//       ) async {
//     try {
//       DocumentSnapshot snap = await firestore.collection('users').doc(uid).get();
//       List following = (snap.data()! as dynamic)['following'];
//
//       if(following.contains(followId)) {
//         await firestore.collection('users').doc(followId).update({
//           'followers': FieldValue.arrayRemove([uid])
//         });
//
//         await firestore.collection('users').doc(uid).update({
//           'following': FieldValue.arrayRemove([followId])
//         });
//       } else {
//         await firestore.collection('users').doc(followId).update({
//           'followers': FieldValue.arrayUnion([uid])
//         });
//
//         await firestore.collection('users').doc(uid).update({
//           'following': FieldValue.arrayUnion([followId])
//         });
//       }
//
//     } catch(e) {
//       print(e.toString());
//     }
//   }
//
//
// }
//
