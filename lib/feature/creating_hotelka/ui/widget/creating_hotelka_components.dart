import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:scalable_flutter_app_starter/core/extension/context.dart';
import 'package:scalable_flutter_app_starter/feature/creating_hotelka/ui/widget/images_list_view.dart';

import '../../../../core/localization/generated/l10n.dart';
import '../../logic/creating_hotelka_notifier.dart';

class _TextFieldElement extends StatelessWidget {
  const _TextFieldElement({
    this.isRequired = false,
    required this.title,
    this.middleWidget,
    this.hint,
    this.suffixIcon,
    required this.controller,
  });
  final bool isRequired;
  final String title;
  final Widget? middleWidget;
  final String? hint;
  final Widget? suffixIcon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(title, style: context.textTheme.titleMedium),
            const Gap(2),
            if (isRequired) Text('*', style: context.textTheme.titleMedium!.copyWith(color: Colors.red)),
          ],
        ),
        if (middleWidget != null) ...[
          const Gap(8),
          middleWidget!,
          const Gap(8),
        ],
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
      isRequired: true,
      title: S.of(context).name,
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
      title: S.of(context).description,
      hint: S.of(context).bouquetDescription,
      controller: context.read<CreatingHotelkaNotifier>().descriptionController,
    );
  }
}

class ReferencesCreatingHotelkaField extends StatelessWidget {
  const ReferencesCreatingHotelkaField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TextFieldElement(
          controller: context.read<CreatingHotelkaNotifier>().referencesController,
          title: S.of(context).references,
          hint: S.of(context).references,
          suffixIcon: const Icon(Icons.link),
          middleWidget: SizedBox(
            height: 70,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => context.read<CreatingHotelkaNotifier>().addReferenceImagePath(),
                  child: Container(
                    width: 70,
                    padding: const EdgeInsets.all(23),
                    decoration: BoxDecoration(
                      color: context.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: context.watch<CreatingHotelkaNotifier>().imagePickerLoading
                        ? CircularProgressIndicator.adaptive(
                            valueColor: AlwaysStoppedAnimation(context.colorScheme.onPrimary),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.colorScheme.onSecondary,
                            ),
                            child: Icon(Icons.add, color: context.colorScheme.onPrimary),
                          ),
                  ),
                ),
                const Gap(8),
                const ImagesListView()
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DateCreatingHotelkaField extends StatelessWidget {
  const DateCreatingHotelkaField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _DateChip(S.of(context).date, Icons.date_range_sharp),
        const Gap(16),
        _DateChip(S.of(context).periodicity, Icons.timelapse),
      ],
    );
  }
}

class _DateChip extends StatelessWidget {
  const _DateChip(this.text, this.icon);

  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: context.colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Text(text, style: TextStyle(color: context.colorScheme.onTertiary)),
              const Gap(8),
              Positioned(right: 0, child: Icon(icon, color: context.colorScheme.onSecondary)),
            ],
          )),
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
        _TextFieldElement(
          controller: readNotifier.categoryController,
          isRequired: true,
          hint: S.of(context).movies,
          title: S.of(context).category,
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

class ImportantCheckBox extends StatelessWidget {
  const ImportantCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    final readNotifier = context.read<CreatingHotelkaNotifier>();

    return Column(
      children: [
        ListTile(
          onTap: () => readNotifier.isImportant = !readNotifier.isImportant,
          contentPadding: EdgeInsets.zero,
          leading: Transform.scale(
            scale: 1.2,
            child: Checkbox(
              onChanged: (value) => readNotifier.isImportant = value!,
              value: context.watch<CreatingHotelkaNotifier>().isImportant,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              side: const BorderSide(color: Colors.black, width: 2),
            ),
          ),
          title: Text(S.of(context).important),
        ),
        const Gap(8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: context.colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(S.of(context).importantDescription),
        )
      ],
    );
  }
}
