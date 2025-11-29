import 'package:convoconnect/core/theme.dart';
import 'package:convoconnect/features.auth/presentation/widgets/auth_button.dart';
import 'package:convoconnect/features.auth/presentation/widgets/auth_input_field.dart';
import 'package:convoconnect/features.auth/presentation/widgets/login_prompt.dart';
import 'package:flutter/material.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showInputValues() {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    print('Username: $username');
    print('Email: $email');
    print('Password: $password');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthInputField(
                hint: "Username",
                icon: Icons.person,
                controller: _usernameController,
                isPassword: false,
              ),
              SizedBox(height: 20),

              AuthInputField(
                hint: "Email",
                icon: Icons.email,
                controller: _emailController,
                isPassword: false,
              ),
              SizedBox(height: 20),
              AuthInputField(
                hint: "Password",
                icon: Icons.lock,
                controller: _passwordController,
                isPassword: true,
              ),
              SizedBox(height: 20),
              AuthButton(text: "Register", onPressed: _showInputValues),
              SizedBox(height: 20),
              LoginPrompt(
                title: "Not registered yet",
                subtitle: "Click here to register",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _builtRegisterButton() {
    return ElevatedButton(
      onPressed: () {
        _showInputValues();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: DefaultColors.buttonColor,
        padding: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(
        "Register",
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  Widget _buildTextInput(
    String hint,
    IconData icon,
    TextEditingController controller,
    bool isPassword,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: DefaultColors.sentMessageInput,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginPrompt() {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: RichText(
          text: TextSpan(
            text: "Already have an account? ",
            style: TextStyle(color: Colors.white),
            children: [
              TextSpan(
                text: "Click here to Login",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
