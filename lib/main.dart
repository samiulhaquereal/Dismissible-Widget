import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<int> items = List<int>.generate(100, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: items.length,
            padding: EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (BuildContext context , int index){
            return Dismissible(
                key: ValueKey<int>(items[index]),
                onDismissed: (DismissDirection direction){
                  setState(() {
                    items.removeAt(index);
                  });
                },
                child: ListTile(
                  title: Text('Item ${items[index]}'),
                ),
              background: Container(
                color: Colors.red,
                child: Icon(Icons.delete),
              ),
            );
            }
        ),
      ),
    );
  }
}

