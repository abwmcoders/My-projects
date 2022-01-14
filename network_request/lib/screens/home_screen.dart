import 'package:flutter/material.dart';
import 'package:network_request/model/person.dart';
import 'package:network_request/services/person_network_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final PersonNetworkService personService = PersonNetworkService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: NetworkImage("https://images.unsplash.com/photo-1635107420370-b9fac732b284?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDN8eGpQUjRobGtCR0F8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60"),
          fit: BoxFit.cover,
        )),
        child: FutureBuilder(
          future: personService.fetchPersons(100),
          builder:
              (BuildContext context, AsyncSnapshot<List<Person>> snapshot) {
            if (snapshot.hasData) {
              return Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Card(
                      color: Colors.black.withOpacity(.5),
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var currentPerson = snapshot.data![index];

                            return ListTile(
                              title: Text(currentPerson.name, style: const TextStyle(color: Colors.white),),
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(currentPerson.imageUrl),
                              ),
                              subtitle:
                                  Text("Phone: ${currentPerson.phoneNumber}", style: const TextStyle(
                                    color: Colors.white,
                                  ),),
                            );
                          }),
                    ),
                  ))
                ],
              );
            } else {
              return const Center(
                child: Icon(
                  Icons.error,
                  size: 40,
                  color: Colors.red,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
