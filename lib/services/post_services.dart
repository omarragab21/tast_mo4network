import '../models/comments_model.dart';
import '../models/post_details_model.dart';
import '../models/posts_model.dart';
import 'dio_client.dart';

class PostApis {
  Future<List<PostsModel>?> getAllPost() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    List<PostsModel> postsModel = [];
    try {
      var response = await Client.client.get(url);
      if (response.statusCode == 200) {
        List responseOfList = response.data;
        postsModel = responseOfList.map((data) => PostsModel.fromJson(data)).toList();

        return postsModel;
      } else {
        return [];
      }
    } catch (e) {
      throw ('get all posts error ==>$e');
    }
  }

  //*
  Future<PostDetailsModel?> getPostDetails(int postId) async {
    String url = 'https://jsonplaceholder.typicode.com/posts/$postId';
    PostDetailsModel postDetailsModel = PostDetailsModel();
    try {
      var response = await Client.client.get(url);
      if (response.statusCode == 200) {
        postDetailsModel = PostDetailsModel.fromJson(response.data);
        return postDetailsModel;
      } else {
        return null;
      }
    } catch (e) {
      throw ('get all posts error ==>$e');
    }
  }

//*
  Future<List<CommentsModel>?> getAllComments(int postId) async {
    String url = 'https://jsonplaceholder.typicode.com/posts/$postId/comments';
    List<CommentsModel> comments = [];
    try {
      var response = await Client.client.get(url);
      if (response.statusCode == 200) {
        List responseOfList = response.data;
        comments = responseOfList.map((data) => CommentsModel.fromJson(data)).toList();
        return comments;
      } else {
        return null;
      }
    } catch (e) {
      throw ('get all posts error ==>$e');
    }
  }

  //*
  Future<bool?> deletePost(int postId) async {
    String url = 'https://jsonplaceholder.typicode.com/posts/$postId';
    try {
      var response = await Client.client.delete(url);
      if (response.statusCode == 200) {
        return true;
      } else {
        return null;
      }
    } catch (e) {
      throw ('get all posts error ==>$e');
    }
  }
}
