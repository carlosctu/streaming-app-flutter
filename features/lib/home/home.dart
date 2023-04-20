import 'package:features/home/bloc/home_bloc.dart';
import 'package:features/home/model/anime_list_response.dart';
import 'package:features/home/model/home_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black26,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
        leading: IconButton(
          splashRadius: 18,
          icon: const Icon(
            Icons.arrow_back_outlined,
            size: 24,
            color: Color(0xffD93B41),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _Body(),
      // Container(
      //   width: double.infinity,
      //   height: double.infinity,
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage('assets/images/facebook.png'),
      //       fit: BoxFit.fill,
      //     ),
      //   ),
      //   child: Text('ímage'),
      // ),
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
              final todo = snapshot.data as HomeResponse;
              return Center(
                child: Text('${todo.attributes}'),
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
