import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/app.dart';
import 'ui/viewmodels/login_viewmodel.dart';
import 'ui/viewmodels/register_viewmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Aquí podrías inicializar Firebase, si lo requieres
  // await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        // Agrega más ViewModels según tus necesidades
      ],
      child: App(),
    ),
  );
}
