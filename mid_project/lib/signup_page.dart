import 'package:flutter/material.dart';
import 'login_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                // ✅ ROW: Back button and title
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back),
                    ),
                    Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                // ✅ CIRCLEAVATAR: Signup icon
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.green[100],
                  child: Icon(Icons.person_add, size: 30, color: Colors.green),
                ),

                SizedBox(height: 20),

                // ✅ PADDING: Form fields
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // ✅ CONTAINER with MARGIN: Name field
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Full Name',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ),

                      // ✅ PADDING: Email field
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                      ),

                      // TextField: Password field
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                    ],
                  ),
                ),

                // ✅ CONTAINER: Signup button
                Container(
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Signup successful message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Account created successfully!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      // Login page pe wapas jayega
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text('Sign Up'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // ✅ BOTTOM NAVIGATION: Bottom bar with login link
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have account?"),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
