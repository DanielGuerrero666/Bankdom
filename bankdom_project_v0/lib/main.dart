import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      ),
      home: const MyHomePage(title: 'Leanring flutter'),
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

  String _currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  final TextEditingController _moneycontroller = TextEditingController();
  final TextEditingController _expensescontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _moneycontroller.dispose();
    _expensescontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bck3.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                      'Current Date: $_currentDate', style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Sizedbox(
              width: double.infinity,
              height: double.infinity,
              child: FittedBox(
                fit: BoxFit.contain, // Ajusta la imagen manteniendo la proporción
                child: Image.asset('assets/images/Floor v1.png'),
                  ),
                ),
              child: Column(
                padding: EdgeInsets.all(16),
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Money
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 4),
                      ],
                    ),                    
                    child: TextField(
                      controller: _moneycontroller,
                      decoration: InputDecoration(
                        hintText: 'Enter your money',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Expenses
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 4),
                      ],
                    ),
                    child: TextField(
                      controller: _expensescontroller,
                      decoration: InputDecoration(
                        hintText: 'Enter your expenses',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
           ),
        ],
      ), 
    );
  }
}
