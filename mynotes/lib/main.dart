import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/views/login_view.dart';
import 'package:mynotes/views/register_view.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
      routes: {
        '/login/': (context) => const LoginView(),
        '/register/': (context) => const RegisterView(),
      },
    ),
  );
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),

      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
          //final user = FirebaseAuth.instance.currentUser;
          //if (user?.emailVerified ?? false) {
          //  return const Text('Done'); // If email is verified, proceed
          //} else {
          //    return const VerifyEmailView();
          //  }
            return const LoginView();
          default:
            return const Text('Loading..'); // Avoid UI errors by returning an empty widget
        }
      },
    );
  }
}
