import 'package:features/home/bloc/home_bloc.dart';
import 'package:features/home/model/home_view_data.dart';
import 'package:features/home/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const route = '/home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return StreamBuilder(
          stream: bloc.dataStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final todo = snapshot.data as Map<AnimeTypes, HomeViewData>;
              return HomeBody(todo: todo);
              // return MyHomePage();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error fetching data'),
              );
            } else {
              bloc.fetch();
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _topContainerHeight = 150.0;
  double _dragStart = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragStart: (DragStartDetails details) {
          // Store the initial drag position
          _dragStart = details.globalPosition.dy;
        },
        onVerticalDragUpdate: (DragUpdateDetails details) {
          // Calculate the drag distance
          double dragDistance = details.globalPosition.dy - _dragStart;

          // Expand the top container by the same amount as the drag distance
          setState(() {
            _topContainerHeight = _topContainerHeight + dragDistance;
          });

          // Reset the drag start position
          _dragStart = details.globalPosition.dy;
        },
        child: Stack(
          children: [
            // Background container that expands when the user drags
            Container(
              height: _topContainerHeight,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
            ),
            // Content that scrolls behind the background container
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text('My App'),
                  pinned: true,
                  expandedHeight: 200.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      'https://picsum.photos/seed/picsum/200/300',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return ListTile(
                        title: Text('Item $index'),
                      );
                    },
                    childCount: 50,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
