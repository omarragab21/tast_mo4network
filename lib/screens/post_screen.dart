// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_mo4network/screens/post_details_screen.dart';
import 'package:task_mo4network/widgets/loading_widget.dart';

import '../provider/post_provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    Future.microtask(() async {
      await context.read<PostProvider>().getAllPosts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<PostProvider>().allPostsIsLoaded
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: Card(
                        elevation: 1.9,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
                        color: Colors.amberAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                context.read<PostProvider>().posts[index].title!,
                                style: const TextStyle(color: Colors.purpleAccent, fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                context.read<PostProvider>().posts[index].body!,
                                style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ElevatedButton(
                                      onPressed: () async {
                                        showDialog(context: context, builder: (context) => const LoadingWidget());
                                        await context
                                            .read<PostProvider>()
                                            .getPostDetails(context.read<PostProvider>().posts[index].id!);
                                        await context
                                            .read<PostProvider>()
                                            .getAllComment(context.read<PostProvider>().posts[index].id!);
                                        Navigator.pop(context);

                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => const PostDetailsScreen()));
                                      },
                                      style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.purpleAccent)),
                                      child: const Text(
                                        'See Post Details',
                                        style: TextStyle(color: Colors.black, fontSize: 12),
                                      )),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        showDialog(context: context, builder: (context) => const LoadingWidget());
                                        await context
                                            .read<PostProvider>()
                                            .deletPost(context.read<PostProvider>().posts[index].id!);
                                        Navigator.pop(context);
                                        const snackBar = SnackBar(
                                          backgroundColor: Colors.amberAccent,
                                          content: Text(
                                            'Delete Post SuccessFully',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.purpleAccent,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20.h,
                    );
                  },
                  itemCount: context.watch<PostProvider>().posts.length),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
