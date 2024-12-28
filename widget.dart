import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> animals = [
    {'name': 'Max', 'type': 'Dog', 'age': '2 years'},
    {'name': 'Mittens', 'type': 'Cat', 'age': '1 year'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal Shelter',
              style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: animals.length,
        itemBuilder: (context, index) {
          final animal = animals[index];
          return ListTile(
            title: Text(animal['name']!,
                  style: TextStyle(color: Colors.black),
            ),
            subtitle: Text('${animal['type']} - ${animal['age']}',
                  style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(animal: animal),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final Map<String, String> animal;

  DetailsPage({required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(animal['name']!,
              style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${animal['name']}',
                  style: TextStyle(color: Colors.black),
            ),
            Text('Type: ${animal['type']}',
                  style: TextStyle(color: Colors.black),
            ),
            Text('Age: ${animal['age']}',
                  style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}