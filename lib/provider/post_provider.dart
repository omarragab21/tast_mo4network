// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

import '../models/comments_model.dart';
import '../models/post_details_model.dart';
import '../models/posts_model.dart';
import '../services/post_services.dart';

class PostProvider extends ChangeNotifier {
//*Varibales
  List<PostsModel> _posts = [];
  bool _allPostsIsLoaded = false;

  List<CommentsModel> _comments = [];
  bool _allCommentsIsLoaded = false;

  PostDetailsModel _postDetailsModel = PostDetailsModel();

//* Getters
  List<PostsModel> get posts => _posts;
  bool get allPostsIsLoaded => _allPostsIsLoaded;

  List<CommentsModel> get comments => _comments;
  bool get allCommentsIsLoaded => _allCommentsIsLoaded;

  PostDetailsModel get postDetailsModel => _postDetailsModel;

//*functions
  Future<void> getAllPosts() async {
    _posts = (await PostApis().getAllPost())!;
    print('Done');
    _allPostsIsLoaded = true;
    notifyListeners();
  }

  //*
  Future<void> getPostDetails(int postId) async {
    _postDetailsModel = (await PostApis().getPostDetails(postId))!;
  }

  //*
  Future<void> getAllComment(int postId) async {
    _comments = (await PostApis().getAllComments(postId))!;
    _allCommentsIsLoaded = false;
    notifyListeners();
  }

  //*
  Future<void> deletPost(int postId) async {
    bool postIsDeleted = (await PostApis().deletePost(postId))!;
    if (postIsDeleted) {
      _posts.removeWhere((post) => post.id == postId);
    }
    notifyListeners();
  }
}
