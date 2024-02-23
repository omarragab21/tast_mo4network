import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../provider/post_provider.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.paddingOf(context).top;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: statusBarHeight),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .50,
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.amberAccent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios)),
                      SizedBox(
                        height: 40.h,
                      ),
                      Text(
                        context.read<PostProvider>().postDetailsModel.title!,
                        style: const TextStyle(color: Colors.purpleAccent, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Text(
                        context.read<PostProvider>().postDetailsModel.body!,
                        style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 100.h,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .40,
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.amber,
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: context.watch<PostProvider>().comments.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 15.h,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Name :  ${context.read<PostProvider>().comments[index].name!} '),
                            SizedBox(
                              height: 30.h,
                            ),
                            Text(
                              "Email : ${context.read<PostProvider>().comments[index].email!}",
                              style: const TextStyle(color: Colors.black, fontSize: 14),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Text(
                              " ${context.read<PostProvider>().comments[index].body!}",
                              style: const TextStyle(color: Colors.black, fontSize: 14),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
