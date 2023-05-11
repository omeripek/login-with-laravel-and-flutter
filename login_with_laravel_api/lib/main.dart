import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_with_laravel_api/service/auth.dart';
import 'package:login_with_laravel_api/screens/home.dart';
import 'package:login_with_laravel_api/screens/onboarding_screen/onboarding.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: ((context) => Auth()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final storage = const FlutterSecureStorage();

  void _attemptAuthentication() async {
    String? key = await storage.read(key: 'auth');
    // ignore: use_build_context_synchronously
    Provider.of<Auth>(context, listen: false).attempt(key);
  }

  @override
  void initState() {
    super.initState();
    _attemptAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<Auth>(
          builder: (context, value, child) {
            if (value.authenticated) {
              return const Home();
            } else {
              return const OnboardingScreen();
            }
          },
        ),
      ),
    );
  }
}