import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ArticleCardSkeleton extends StatelessWidget {
  const ArticleCardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color baseColor = Color.fromARGB(255, 156, 156, 156);
    const Color highlightColor = Color.fromARGB(255, 197, 197, 197);
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        child: Column(
          children: <Widget>[
            Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Container(
                height: 15,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Container(
                height: 12,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
