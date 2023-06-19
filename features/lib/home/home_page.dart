import 'package:features/home/bloc/home_bloc.dart';
import 'package:features/home/widgets/config/home_loading_shimmer.dart';
import 'package:features/home/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc get homeBloc => context.read<HomeBloc>();

  @override
  void initState() {
    homeBloc.add(HomeEventFetchAnimeList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        // bottomNavigationBar: const MyWidget(),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return StreamBuilder(
              stream: homeBloc.stream,
              builder: (context, snapshot) {
                final state = snapshot.data?.status;
                switch (state) {
                  case HomeStatus.valid:
                    final data = snapshot.data!.animeList;
                    return HomeBody(data: data);
                  case HomeStatus.loading:
                    return const HomeLoadingShimmer();
                  case HomeStatus.invalid:
                  default:
                    return const Center(
                      child: Text('Error fetching data'),
                    );
                }
              },
            );
          },
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      margin: EdgeInsets.all(12),
      child: BottomNavigationBar(
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  // _onTabTapped(0);
                },
              ),
              label: '1'),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.access_alarm_rounded),
                onPressed: () {
                  // _onTabTapped(0);
                },
              ),
              label: '2'),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.abc),
                onPressed: () {
                  // _onTabTapped(0);
                },
              ),
              label: '3'),
        ],
      ),
    );
  }
}
