import 'package:flutter/material.dart';
import 'package:network_testing/models/tech_news.dart';
import 'package:network_testing/services/tech_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Datum> futureTest;

  @override
  void initState(){
    super.initState();
    futureTest = fetchTest();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic testing"),
        centerTitle: true,
      ),
      body: FutureBuilder<Datum>(
        future: futureTest,
        builder: (context, snapshot){
        return ListView.builder(itemBuilder: (context, index){
           if (snapshot.hasData) {
      return ListTile(
        title: Text(snapshot.data!.avatar),
      );
    } else if (snapshot.hasError) {
      return Text('${snapshot.error}');
    }

    // By default, show a loading spinner.
    return const CircularProgressIndicator();
        });
      }),
    );
  }
}