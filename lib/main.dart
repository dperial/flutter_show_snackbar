import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:show_snackbar_bloc/bloc/show_snackbar_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowSnackbarBloc(),
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataBloc = BlocProvider.of<ShowSnackbarBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: BlocListener<ShowSnackbarBloc, ShowSnackbarState>(
        listener: (context, state) {
          if (state is ShowSnackbarSuccess) {
            // ignore: deprecated_member_use
            Scaffold.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.greenAccent,
                content: Text('Success Yeahh !!!')));
          }
        },
        child: BlocBuilder<ShowSnackbarBloc, ShowSnackbarState>(
          builder: (context, state) {
            if (state is ShowSnackbarInitial) {
              return const Center(child: Text('Press the Button !'));
            }
            if (state is ShowSnackbarSuccess) {
              return const Center(child: Text('Success Yeahh !!!'));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.play_arrow),
            onPressed: () {
              dataBloc.add(FetchData());
            },
          ),
        ],
      ),
    );
  }
}
