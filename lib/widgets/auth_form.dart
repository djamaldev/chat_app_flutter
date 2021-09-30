import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(this.submitFn, {Key? key}) : super(key: key);

  final void Function(String email, String password, String userName, bool isLogin, BuildContext ctx) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLogin = true;
  String _email = "";
  String _password = "";
  String _userName = "";

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus(); // automatically hide keyboard when clic on button login or sign up
    if (isValid == true) {
      _formKey.currentState?.save();
      widget.submitFn(_email.trim(), _password.trim(), _userName.trim(), _isLogin, context);//trim() if user makes space after email or password or user name
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  key: ValueKey("email"), // each field has a key
                  validator: (val) {
                    if (val!.isEmpty || !val.contains("@")) {
                      return "Please enter a valid email adresse!";
                    }
                    return null;
                  },
                  onSaved: (val) => _email = val!,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: "Email adresse"),
                ),
                if (!_isLogin) //for show user name field on sign up only
                  TextFormField(
                    key: ValueKey("username"),
                    validator: (val) {
                      if (val!.isEmpty || val.length < 4) {
                        return "Please enter at least 4 charachters!";
                      }
                      return null;
                    },
                    onSaved: (val) => _userName = val!,
                    decoration: InputDecoration(labelText: "User name"),
                  ),
                TextFormField(
                  key: ValueKey("password"),
                  validator: (val) {
                    if (val!.isEmpty || val.length < 7) {
                      return "Please password must contains at least 7 charachters!";
                    }
                    return null;
                  },
                  onSaved: (val) => _password = val!,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                    onPressed: _submit,
                    child: Text(_isLogin ? "Sign in" : "Sign up")),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                  child: Text(
                      _isLogin
                          ? "Create a new account"
                          : "Already have an account ?",
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
