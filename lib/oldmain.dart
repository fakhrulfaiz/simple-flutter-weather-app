// import 'package:flutter/material.dart';
// void main() {
//   runApp(const MaterialApp(
//     home:Home(),
//   ));
// }
//
//
// class Home extends StatelessWidget {
//   const Home({super.key});
//
//   void _justTest() {
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//
//       appBar: AppBar(
//         title: const Text("My First App"),
//         centerTitle: true,
//         backgroundColor: Colors.deepPurpleAccent[200]
//         ,
//       ),
//       body: TestView(
//         justTest : _justTest,
//       ),
//
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {  },
//         backgroundColor: Colors.deepPurpleAccent[200],
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// class TestView extends StatefulWidget{
//   final VoidCallback justTest;
//
//
//   const TestView({
//     super.key,
//     required this.justTest,
//   });
//
//   @override
//   State<TestView> createState() => _TestViewState();
//
// }
//
// class _TestViewState extends State<TestView> {
//   int _count = 0;
//
//   void _incrementCount() {
//     setState(() => _count++);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Count: $_count',
//             style: const TextStyle(fontSize: 24),
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _incrementCount,
//             child: const Text('Increment'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class MyAppBar extends AppBar{
//   MyAppBar({super.key});
//
// }
//
//
//
