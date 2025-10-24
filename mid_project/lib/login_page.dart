import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'students_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() {
    // ✅ STATIC EMAIL AND PASSWORD CHECK
    if (_emailController.text == "m.ammanullah2005@gmail.com" &&
        _passwordController.text == "Ammanullah123") {
      setState(() {
        _isLoading = true;
      });

      // ✅ LOADING ANIMATION KE LIYE DELAY
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });
        // ✅ SUCCESSFUL LOGIN - STUDENTS PAGE PE JAYEGA
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => StudentsPage()),
        );
      });
    } else {
      // ✅ WRONG CREDENTIALS ERROR
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid email or password'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ CIRCLEAVATAR: App logo
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue[100],
              child: Icon(Icons.school, size: 50, color: Colors.blue),
            ),

            SizedBox(height: 30),

            // ✅ PADDING: Form container
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // ✅ ROW: Email input field
                  Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'm.ammanullah2005@gmail.com',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // ✅ ROW: Password input field
                  Row(
                    children: [
                      Icon(Icons.lock),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Ammanullah123',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ✅ CONTAINER with MARGIN: Login button
            Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _login,
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('Login'),
              ),
            ),

            // ✅ ROW: Signup link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
