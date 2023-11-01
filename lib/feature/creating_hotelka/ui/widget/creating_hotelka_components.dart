import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:scalable_flutter_app_starter/core/extension/context.dart';

import '../../../../core/localization/generated/l10n.dart';
import '../../logic/creating_hotelka_notifier.dart';

class _TextFieldElement extends StatelessWidget {
  final String text;
  final String? hint;
  final Widget? suffixIcon;
  final TextEditingController controller;

  const _TextFieldElement({
    required this.text,
    this.hint,
    this.suffixIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: context.textTheme.titleMedium),
        const Gap(8),
        TextField(
          controller: controller,
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}

class NameCreatingHotelkaField extends StatelessWidget {
  const NameCreatingHotelkaField({super.key});

  @override
  Widget build(BuildContext context) {
    return _TextFieldElement(
      text: S.of(context).name,
      hint: S.of(context).bouquetOfRose,
      controller: context.read<CreatingHotelkaNotifier>().nameController,
    );
  }
}

class DescriptionCreatingHotelkaField extends StatelessWidget {
  const DescriptionCreatingHotelkaField({super.key});

  @override
  Widget build(BuildContext context) {
    return _TextFieldElement(
      text: S.of(context).description,
      hint: S.of(context).bouquetDescription,
      controller: context.read<CreatingHotelkaNotifier>().descriptionController,
    );
  }
}

class CategoryCreatingHotelkaField extends StatelessWidget {
  const CategoryCreatingHotelkaField({super.key});

  @override
  Widget build(BuildContext context) {
    final watchNotifier = context.watch<CreatingHotelkaNotifier>();
    final readNotifier = context.read<CreatingHotelkaNotifier>();

    return Column(
      children: [
        ListenableBuilder(
          listenable: readNotifier.categoryController,
          builder: (context, _) {
            return _TextFieldElement(
              controller: readNotifier.categoryController,
              text: S.of(context).category,
              suffixIcon: watchNotifier.isNewCategory
                  ? IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: readNotifier.addNewCategory,
                    )
                  : null,
            );
          },
        ),
        const Gap(16),
        SizedBox(
          height: 30,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: watchNotifier.categories.length,
            separatorBuilder: (context, index) => const Gap(8),
            itemBuilder: (context, index) {
              final category = watchNotifier.categories[index];
              return _CategoryChip(text: category);
            },
          ),
        ),
      ],
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String text;

  const _CategoryChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<CreatingHotelkaNotifier>().pickedCategory = text,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: context.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
