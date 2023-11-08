import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../logic/creating_hotelka_notifier.dart';

class ImagesListView extends StatelessWidget {
  const ImagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final imagePaths = context.watch<CreatingHotelkaNotifier>().referencesImagePaths;
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        separatorBuilder: (context, index) => const Gap(8),
        itemBuilder: (context, index) {
          final imagePath = imagePaths[index];
          return SizedBox(
            width: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                File(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
