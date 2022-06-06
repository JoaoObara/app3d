import 'package:app3d/services/auth_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //?????????????
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: const AppWidget(),
    ),
  );
}
