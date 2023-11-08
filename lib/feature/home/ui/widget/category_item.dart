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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: context.colorScheme.onSecondary,
        ),
        alignment: Alignment.center,
        child: FittedBox(
          child: Text(
            title,
            style: context.textTheme.titleMedium!.copyWith(color: context.colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }
}
