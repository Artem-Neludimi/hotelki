import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:scalable_flutter_app_starter/core/extension/context.dart';
import 'package:scalable_flutter_app_starter/core/services/api/model/hotelka/hotelka_model.dart';

import '../../../../core/navigation/route.dart';
import '../../../auth/logic/bloc/auth_bloc.dart';
import '../../logic/bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final authState = context.watch<AuthBloc>().state;
    if (authState is AuthAuthorize) {
      context.read<HomeBloc>().add(Started(authState.user!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Хотелки мне'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => AppRoute.settings.push(context),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => AppRoute.creatingHotelka.push(context).then((value) {
          if (value is HotelkaModel) {
            context.read<HomeBloc>().add(CreateHotelka(value));
          }
        }),
        child: const Icon(Icons.add),
      ),
      body: const _HomeBody(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeNoPartner) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'У вас нет партнера, чтобы использовать приложение, вам нужно добавить партнёра',
                  textAlign: TextAlign.center,
                ),
                const Gap(16),
                ElevatedButton(
                  onPressed: () => AppRoute.partnerSettings.push(context),
                  child: const Text('Добавить'),
                )
              ],
            ),
          );
        }
        if (state is! HomeLoaded) return const Center(child: CircularProgressIndicator());
        if (state.hotelkaItems.isEmpty) return const Center(child: Text('Для вас пока нет хотелок'));

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
                        child: item.isDone ? Icon(Icons.check, color: context.colorScheme.onSecondary) : null,
                      ),
                      title: Row(
                        children: [
                          Text(item.name),
                          const Gap(8),
                          if (item.isImportant) Icon(Icons.star, color: context.colorScheme.tertiary),
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
    );
  }
}
