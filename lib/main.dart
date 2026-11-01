import 'package:flutter/material.dart';
import 'package:wisata_candi_charoline/data/candi_data.dart';
import 'package:wisata_candi_charoline/screens/detail_screen.dart';
import 'package:wisata_candi_charoline/screens/profile_screen.dart';
import 'package:wisata_candi_charoline/providers/favorite_provider.dart';
import 'package:wisata_candi_charoline/providers/auth_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.deepPurple),
          titleTextStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ).copyWith(
          primary: Colors.deepPurple,
          surface: Colors.deepPurple.shade50,
        ),
        useMaterial3: true,
      ),
      home: DetailScreen(candi: candiList[0]),
    );
  }
}
