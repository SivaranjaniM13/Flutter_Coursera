import 'package:flutter/material.dart';

void main() => runApp(const MyTimeTrackerApp());

class MyTimeTrackerApp extends StatelessWidget {
  const MyTimeTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Final Project',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => const SignupScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/detail': (context) => const DetailScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}

// --- TASK 5, 6, 7: SIGNUP & ERROR ---
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool showError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Create Account", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            TextField(decoration: const InputDecoration(labelText: 'Username')), // Field 1
            TextField(decoration: const InputDecoration(labelText: 'Email')),    // Field 2
            TextField(decoration: const InputDecoration(labelText: 'Password'), obscureText: true), // Field 3
            if (showError) const Text("Error: User already exists!", style: TextStyle(color: Colors.red)), // Task 7
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => setState(() => showError = true), // Click to show Task 7 error
              child: const Text("Sign Up"),
            ),
            TextButton(onPressed: () => Navigator.pushNamed(context, '/login'), child: const Text("Login Link")),
          ],
        ),
      ),
    );
  }
}

// --- TASK 8, 9, 10: LOGIN & ERROR ---
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(decoration: InputDecoration(labelText: 'Email')), // Field 1
            const TextField(decoration: InputDecoration(labelText: 'Password'), obscureText: true), // Field 2
            if (showError) const Text("Error: Invalid Email/Password", style: TextStyle(color: Colors.red)), // Task 10
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/home'), child: const Text("Login")),
            ElevatedButton(onPressed: () => setState(() => showError = true), child: const Text("Trigger Login Error")),
            TextButton(onPressed: () => Navigator.pushNamed(context, '/signup'), child: const Text("Sign Up Link")),
          ],
        ),
      ),
    );
  }
}

// --- TASK 11, 12: HOME SCREEN & LOGO ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.timer, size: 30), // TASK 12: APP LOGO
        title: const Text("Time Tracker Pro"),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () => Navigator.pushNamed(context, '/settings')), // TASK 22
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Main Dashboard", style: TextStyle(fontSize: 20)),
            const Icon(Icons.arrow_forward, size: 40), // TASK 14: Navigation Icon
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/detail'),
              child: const Text("Go to Details"),
            ),
          ],
        ),
      ),
    );
  }
}

// --- TASK 13, 15: DETAIL SCREEN ---
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Item Details")),
      body: const Center(
        child: Text("Item Info: Coding Project - 45 Minutes Spent"), // TASK 15
      ),
    );
  }
}

// --- TASK 19, 20: API INTEGRATION UX ---
class ApiSection extends StatelessWidget {
  const ApiSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: const [
          Text("Data Fetched from API:", style: TextStyle(fontWeight: FontWeight.bold)),
          ListTile(title: Text("External Task 1: API Response 200")), // TASK 20
        ],
      ),
    );
  }
}

// --- TASK 21, 23, 24, 25: SETTINGS ---
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings Screen")), // TASK 25
      body: ListView(
        children: [
          const ListTile(leading: Icon(Icons.notifications), title: Text("Configure Notifications")), // TASK 23
          const ListTile(leading: Icon(Icons.storage), title: Text("Local Storage - 24kb Used")), // TASK 17/18
          const ApiSection(), // API Logic display
          const SizedBox(height: 20),
          // TASK 28: Notification Alert
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => const AlertDialog(
                  title: Text("Notification Alert"),
                  content: Text("Test notification successfully triggered!"),
                ),
              );
            },
            child: const Text("Trigger Test Notification"),
          ),
        ],
      ),
    );
  }
}
