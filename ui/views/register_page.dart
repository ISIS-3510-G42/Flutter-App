import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/register_viewmodel.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerVM = Provider.of<RegisterViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: registerVM.setEmail,
              decoration: InputDecoration(labelText: 'Correo'),
            ),
            TextField(
              onChanged: registerVM.setPassword,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            if (registerVM.errorMessage != null)
              Text(
                registerVM.errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            registerVM.isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () async {
                await registerVM.register();
                if (registerVM.errorMessage == null) {
                  // Registro exitoso, volver al login
                  Navigator.pop(context);
                }
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
