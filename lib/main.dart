import 'package:flutter/material.dart';
import 'package:translator/translator.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Topicos AppTraductor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String textoTraducido = 'Traduccion';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Card(
        margin: const EdgeInsets.all(12),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text('Texto en Español'),
            const SizedBox(height: 8,),
            TextField(
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                hintText: 'Introducir Texto',
              ),
              onChanged: (text) async{
                /*const apiKey = '';
                const to = 'es';
                final url = Uri.parse(
                  'https://translation.googleapis.com/language/translate/v2?q=$text&target=$to&key=$apiKey'
                );*/

                final traduccion = await text.translate(
                  from: 'es', //'auto'  
                  to: 'en',
                );

                setState(() {
                  textoTraducido = traduccion.text;
                  
                });
                  
              },
            ),
            const Divider(height: 32,),
            Text(
              textoTraducido,
              style: const TextStyle(
                fontSize: 36,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
