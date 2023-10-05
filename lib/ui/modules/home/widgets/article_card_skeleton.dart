import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ArticleCardSkeleton extends StatelessWidget {
  const ArticleCardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        child: Column(
          children: <Widget>[
            Shimmer.fromColors(
              baseColor: const Color.fromARGB(255, 156, 156, 156),
              highlightColor: const Color.fromARGB(255, 197, 197, 197),
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
              baseColor: const Color.fromARGB(255, 156, 156, 156),
              highlightColor: const Color.fromARGB(255, 197, 197, 197),
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
              baseColor: const Color.fromARGB(255, 156, 156, 156),
              highlightColor: const Color.fromARGB(255, 197, 197, 197),
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
              baseColor: const Color.fromARGB(255, 156, 156, 156),
              highlightColor: const Color.fromARGB(255, 197, 197, 197),
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
