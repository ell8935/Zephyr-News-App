import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class ArticleCardSkeleton extends StatelessWidget {
  const ArticleCardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color baseColor = Color.fromARGB(255, 156, 156, 156);
    const Color highlightColor = Color.fromARGB(255, 197, 197, 197);

    return Card(
      color: baseColor,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Shimmer.fromColors(
                baseColor: baseColor,
                highlightColor: highlightColor,
                child: const _SkeletonContainer(heightToScreenRatio: 0.25),
              ),
              const SizedBox(
                height: 15,
              ),
              Shimmer.fromColors(
                baseColor: baseColor,
                highlightColor: highlightColor,
                child: const _SkeletonContainer(heightToScreenRatio: 0.02),
              ),
              const SizedBox(
                height: 10,
              ),
              Shimmer.fromColors(
                baseColor: baseColor,
                highlightColor: highlightColor,
                child: const _SkeletonContainer(heightToScreenRatio: 0.05),
              ),
              const SizedBox(
                height: 5,
              ),
              Shimmer.fromColors(
                baseColor: baseColor,
                highlightColor: highlightColor,
                child: const _SkeletonContainer(heightToScreenRatio: 0.1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkeletonContainer extends StatelessWidget {
  final double heightToScreenRatio;

  const _SkeletonContainer({
    required this.heightToScreenRatio,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height * heightToScreenRatio,
      width: MediaQuery.of(context).size.width,
    );
  }
}
