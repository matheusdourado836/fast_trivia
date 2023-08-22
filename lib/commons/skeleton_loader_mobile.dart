import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonLoaderMobile extends StatelessWidget {
  const SkeletonLoaderMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width * .9,
          height: MediaQuery.of(context).size.height * .7,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 24.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
              ),
              const QuestionPlaceHolder(),
              const SizedBox(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RadioPlaceHolder(),
                    SizedBox(height: 8.0),
                    RadioPlaceHolder(),
                    SizedBox(height: 8.0),
                    RadioPlaceHolder(),
                    SizedBox(height: 8.0),
                    RadioPlaceHolder(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionPlaceHolder extends StatelessWidget {
  const QuestionPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 24.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 24.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 24.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 24.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}


class RadioPlaceHolder extends StatelessWidget {
  const RadioPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25))
            ),
          ),
        ),
        Container(
          width: 240,
          height: 24.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

