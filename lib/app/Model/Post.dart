import 'package:cloud_firestore/cloud_firestore.dart';

class Post{
  final String description;
  final String uid;
  final String username;
  final String postId;
  final datePublished;
  final String  postUrl;
  final String  profileUrl;
  final likes;

  const Post(
      {required this.description,
        required this.uid,
        required this.username,
        required this.likes,
        required this.postId,
        required this.datePublished,
        required this.postUrl,
        required this.profileUrl,
      });

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      description: snapshot["description"],
      uid: snapshot["uid"],
      likes: snapshot["likes"],
      postId: snapshot["postId"],
      datePublished: snapshot["datePublished"],
      username: snapshot["username"],
      postUrl: snapshot['postUrl'],
      profileUrl: snapshot['profImage'],
    );
  }

  Map<String, dynamic> toJson() => {
    "description": description,
    "uid": uid,
    "likes": likes,
    "username": username,
    "postId": postId,
    "datePublished": datePublished,
    'postUrl': postUrl,
    'profImage': profileUrl
  };
}

