import 'package:flutter/material.dart';
import 'package:scalable_flutter_app_starter/core/extension/context.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(color: context.colorScheme.primary),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: context.colorScheme.onSecondary,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: context.textTheme.titleMedium!.copyWith(
            fontSize: switch (title.length) {
              > 25 => 12,
              > 50 => 10,
              > 100 => 8,
              _ => null,
            },
            color: context.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
