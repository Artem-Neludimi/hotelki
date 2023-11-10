import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalable_flutter_app_starter/core/extension/context.dart';
import 'package:scalable_flutter_app_starter/core/navigation/route.dart';

import '../../logic/bloc/home_bloc.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => AppRoute.stories.push(context, extra: {"category": state.activeCategoriesString[index]}),
          child: Container(
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
                state.activeCategoriesString[index],
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium!.copyWith(
                  fontSize: switch (state.activeCategoriesString[index].length) {
                    > 25 => 12,
                    > 50 => 10,
                    > 100 => 8,
                    _ => null,
                  },
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
