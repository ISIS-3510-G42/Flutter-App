import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/app.dart';
import 'ui/viewmodels/login_viewmodel.dart';
import 'ui/viewmodels/register_viewmodel.dart';
import 'ui/viewmodels/map_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => MapViewModel()),
        // Agrega más ViewModels según tus necesidades
      ],
      child: App(),
    ),
  );
}

