import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:scalable_flutter_app_starter/core/extension/context.dart';
import 'package:scalable_flutter_app_starter/core/navigation/route.dart';
import 'package:scalable_flutter_app_starter/feature/user/ui/widget/profile_tab.dart';

import '../../logic/bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final _tabs = <_HomeTab>[
    _HomeTab(
      label: 'Home',
      icon: Icons.home,
      builder: (context) => const _MainHomeTab(),
    ),
    _HomeTab(
      label: 'Explore',
      icon: Icons.explore,
      builder: (context) => const Center(child: Text('Explore')),
    ),
    _HomeTab(
      label: 'Profile',
      icon: Icons.person,
      builder: (context) => const ProfileTab(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Widget body;
    final Widget? bottomNavigationBar;
    final content = _tabs[_selectedIndex].builder(context);

    if (context.isWide) {
      body = Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() => _selectedIndex = index);
            },
            destinations: [
              for (final tab in _tabs)
                NavigationRailDestination(
                  label: Text(tab.label),
                  icon: Icon(tab.icon),
                ),
            ],
          ),
          Expanded(child: content),
        ],
      );
      bottomNavigationBar = null;
    } else {
      body = SafeArea(child: content);
      bottomNavigationBar = BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: [
          for (final tab in _tabs)
            BottomNavigationBarItem(
              label: tab.label,
              icon: Icon(tab.icon),
            ),
        ],
      );
    }

    return Scaffold(
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () => AppRoute.creatingHotelka.push(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _HomeTab {
  const _HomeTab({
    required this.label,
    required this.icon,
    required this.builder,
  });

  final String label;
  final IconData icon;
  final WidgetBuilder builder;
}

//TODO: make normal home page
class _MainHomeTab extends StatelessWidget {
  const _MainHomeTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
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
    );
  }
}
