import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:scalable_flutter_app_starter/core/extension/context.dart';
import 'package:scalable_flutter_app_starter/core/extension/string.dart';
import 'package:scalable_flutter_app_starter/feature/home/logic/story_notifier.dart';
import 'package:story_view/story_view.dart';

import '../../../../core/localization/generated/l10n.dart';
import '../../../../core/util/urls.dart';
import '../../domain/category_story_model.dart';
import '../../logic/bloc/home_bloc.dart';

class StoriesPage extends StatefulWidget {
  const StoriesPage({super.key, required this.category});

  final String category;

  @override
  State<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  final storyController = StoryController();

  @override
  void dispose() {
    super.dispose();
    storyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final storyDataList = state.buildCategoryStories(widget.category);

        return Scaffold(
          body: StoryView(
            controller: storyController,
            onVerticalSwipeComplete: (direction) {
              if (direction == Direction.down) {
                context.pop();
              } else if (direction == Direction.up) {
                final url = context.read<StoriesNotifier>().referenceUrl;
                if (url.isValidUrl()) {
                  Urls.show(url);
                }
              }
            },
            onComplete: () => context.pop(),
            progressPosition: ProgressPosition.top,
            repeat: false,
            storyItems: [
              ..._buildStories(storyDataList).expand((element) => element).toList(),
            ],
          ),
        );
      },
    );
  }

  List<List<StoryItem>> _buildStories(List<CategoryStoryData> storyDataList) {
    return storyDataList.map((storyData) {
      if (storyData.imageUrls.isNotEmpty) {
        return storyData.imageUrls
            .map((imageUrl) => StoryItem(
                  _StoryWidget(
                    storyController,
                    storyData.name,
                    storyData.description,
                    storyData.link,
                    storyData.isImportant,
                    imageUrl,
                  ),
                  duration: const Duration(seconds: 3),
                ))
            .toList();
      }

      return [
        StoryItem(
          _StoryWidget(
            storyController,
            storyData.name,
            storyData.description,
            storyData.link,
            storyData.isImportant,
            storyData.imageUrls.first,
          ),
          duration: const Duration(seconds: 3),
        )
      ];
    }).toList();
  }
}

class _StoryWidget extends StatelessWidget {
  const _StoryWidget(
    this.storyController,
    this.name,
    this.description,
    this.link,
    this.isImportant,
    this.imageUrl,
  );

  final StoryController storyController;
  final String name;
  final String description;
  final String link;
  final bool isImportant;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    context.read<StoriesNotifier>().referenceUrl = link;
    return Container(
      key: UniqueKey(),
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          StoryImage.url(
            imageUrl,
            controller: storyController,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                    bottom: 24,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  color: Colors.black54,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            name,
                            style: context.textTheme.titleLarge!.copyWith(
                              color: context.colorScheme.onPrimary,
                            ),
                          ),
                          const Gap(2),
                          if (isImportant) Icon(Icons.star, color: context.colorScheme.tertiary),
                        ],
                      ),
                      if (description.isNotEmpty) ...[
                        const Gap(8),
                        Text(
                          description,
                          style: TextStyle(
                            color: context.colorScheme.onPrimary,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (link.isValidUrl()) ...[
                  const Gap(8),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: context.colorScheme.onPrimary,
                    ),
                    child: Text(S.of(context).link),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: context.colorScheme.onPrimary),
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}
