import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ),
  );
}

//can be created with "stl"
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late final TextEditingController _username;
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    //_username = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    //_username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     {
      
    }
    return Scaffold(
      //scaffold is basic building of a widget
      appBar: AppBar(
        //bar on the top of the screen
        title: const Text('Register'), //title of the top of the screen
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState){
            case ConnectionState.done:
              return Column(
            children: [
              //create text fields using TextField(),
              //TextField(
              //controls: _username,),
              TextField(
                controller: _email,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Enter your email address',
                ),
              ),
              TextField(
                controller: _password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  hintText: 'Enter your password here',
                ),
              ),
              TextButton(
                onPressed: () async {
                  //using the test editng as a proxy to access the testfield/on pressed it should connedt to fire base so wait for some time ..async
                  final email = _email.text;
                  final password = _password.text;

                  //creating a user with the email and password
                  final userCredential = FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: email, password: password);
                  print(userCredential);
                },
                child: const Text('Register'),
              ),
            ],
          );
          default:
          return const Text('Loading...');
          }
          
        },
      ),
    );
  }
}



//widget flutter bindings before void binding