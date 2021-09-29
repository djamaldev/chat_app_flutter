import 'package:chatappv2/screens/auth_screen.dart';
import 'package:chatappv2/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        backgroundColor: Colors.pink,
        /*colorScheme: ColorScheme(
          primary: Colors.pink,
          primaryVariant: Colors.pink,
          secondary: Colors.deepPurple,
          secondaryVariant: Colors.deepPurple,
          background: Colors.pink,
          surface: Colors.pink,
          onBackground: Colors.pink,
          error: Colors.redAccent,
          onError: Colors.redAccent,
          onPrimary: Colors.redAccent,
          onSecondary: Colors.deepPurple,
          onSurface: Colors.pink,
          brightness: Brightness.dark,
        ),*/
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.pink,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          )
        )

      ),
      home: AuthScreen()//const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/*class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          FirebaseFirestore.instance.collection('chats/BK48NlctlumFwrmXdy6z/text').snapshots().listen((event) {
            print(event.docs[0]['textmsg']);
          });
        },
        child: const Icon(Icons.add),
      ), 
    );
  }
}*/
