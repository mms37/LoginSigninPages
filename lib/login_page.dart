import 'package:flutter/material.dart';
import 'user.dart' as myUser; // User sınıfı için alias ekledik
import 'welcome_page.dart' as WelcomePage; // WelcomePage sınıfı için alias ekledik
import 'register_page.dart' as RegisterPage; // RegisterPage sınıfı için alias ekledik

// ...

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kullanıcı Girişi')),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Kullanıcı Adı'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Kullanıcı adı boş olamaz';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Şifre'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Şifre boş olamaz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Kullanıcı adı ve şifre doğrulandı, hoş geldiniz sayfasına yönlendir
                    String username = _usernameController.text;
                    String password = _passwordController.text;
                    myUser.User user = myUser.User(username: username, password: password);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomePage.WelcomePage(user: user),
                      ),
                    );
                  }
                },
                child: Text('Giriş'),
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  // Kayıt ol sayfasına yönlendir
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage.RegisterPage()),
                  );
                },
                child: Text('Kaydol'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
