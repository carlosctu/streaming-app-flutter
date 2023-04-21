import 'package:features/home/bloc/home_bloc.dart';
import 'package:features/home/model/home_view_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const route = '/home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   bottom: PreferredSize(
      //     preferredSize: const Size.fromHeight(1.0),
      //     child: Container(
      //       decoration: const BoxDecoration(
      //         border: Border(
      //           bottom: BorderSide(
      //             color: Colors.black26,
      //             width: 1.0,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      //   leading: IconButton(
      //     splashRadius: 18,
      //     icon: const Icon(
      //       Icons.arrow_back_outlined,
      //       size: 24,
      //       color: Color(0xffD93B41),
      //     ),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      // ),
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
              final todo = snapshot.data as HomeViewData;
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: kToolbarHeight),
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              '${todo.data[1].attributes?.posterImage?.original}'),
                          fit: BoxFit.fitWidth,
                          alignment: const Alignment(0, -0.25)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 32,
                          padding: const EdgeInsets.only(right: 2),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffD93B41),
                          ),
                          child: IconButton(
                            splashRadius: 18,
                            icon: const Icon(
                              Icons.login_outlined,
                              size: 18,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error fetching data'),
              );
            } else {
              bloc.fetch();
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}
