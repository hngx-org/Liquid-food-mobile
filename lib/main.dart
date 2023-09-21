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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headlineMedium,
      //       ),
      //       // Include your AvatarWidget here
      //       // const AvatarWidget(
      //       //   image: 'assets/images/',
      //       //   width: 100.0,
      //       //   height: 100.0,
      //       //   radius: 50.0,
      //       // ),
      //       const CommentWidget(
      //         initialCommentText: 'This is a comment',
      //       ),
             
      //     ],
      //   ),
      // ),
      //     body: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 10),
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: <Widget>[
      //         const Text('Home Icon'),
      //         AppSvgIcons.home,
      //         const Text('Home Active'),
      //         AppSvgIcons.homeActive,
      //         const Text('Hambuger'),
      //         AppSvgIcons.hamburgerDark,
      //         const Text('Hambuger Primary'),
      //         AppSvgIcons.hamburgerPrimary,
      //         const Text('Hambuger Light'),
      //         Container(
      //           color: Colors.black,
      //           padding: const EdgeInsets.all(10),
      //           child: AppSvgIcons.hamburgerLight,
      //         ),
      //         const Text('Luch Sent'),
      //         AppSvgIcons.lunchSent,
      //         const Text('Withdrawal'),
      //         AppSvgIcons.withdrawal,
      //         const Text('Mini Action Button'),
      //       ],
      //     ),
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
        
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
