import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:scalable_flutter_app_starter/core/extension/context.dart';

import '../../../../core/navigation/route.dart';
import '../../logic/bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Хотелки мне'),
        actions: [
          IconButton(
            onPressed: () => AppRoute.settings.push(context),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => AppRoute.creatingHotelka.push(context),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) return const Center(child: CircularProgressIndicator());

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(16),
                LinearProgressIndicator(
                  minHeight: 6,
                  value: state.percentHotelkaItemsDone,
                ),
                const Gap(16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.heart_broken),
                    Icon(Icons.favorite),
                  ],
                ),
                const Gap(16),
                Text(DateFormat('dd.MM.yyyy').format(DateTime.now())),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.hotelkaItems.length,
                    itemBuilder: (context, index) {
                      final item = state.hotelkaItems[index];
                      return ListTile(
                        onTap: () => context.read<HomeBloc>().add(OnHotelkaItemTap(index)),
                        leading: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: context.colorScheme.onSecondary,
                              width: 2,
                            ),
                          ),
                          child: item.$2 ? Icon(Icons.check, color: context.colorScheme.onSecondary) : null,
                        ),
                        title: Row(
                          children: [
                            Text(item.$1),
                            const Gap(8),
                            if (item.$3) Icon(Icons.star, color: context.colorScheme.tertiary),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
