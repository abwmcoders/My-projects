import 'package:counter_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterScreen(),
    );
  }
}

///////

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  @override
  Widget build(BuildContext context) {
    final _counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => CounterBloc(0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<CounterBloc, int>(
                      builder: (BuildContext context, int state) {
                    return Text(
                      'Counter Value:  $state',
                      style: Theme.of(context).textTheme.headline3,
                    );
                  }),

                  // Text(
                  //   '$_counter',
                  //   style: Theme.of(context).textTheme.headline3,
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _counterBloc.add(CounterEvents.increement);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              _counterBloc.add(CounterEvents.decreement);
            },
            tooltip: 'Decreement',
            child: const Icon(Icons.minimize),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
