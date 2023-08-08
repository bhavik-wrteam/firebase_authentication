import 'package:flutter/material.dart';
import 'package:untitled1/functions/authFunction.dart';
import 'package:untitled1/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool islogin = true;

  String email = '';
  String password = '';
  String username = '';
  late Future<bool> allowLogin;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image.network(
                        'https://eshopweb.store/uploads/media/2022/eShop_Single_Vendor_Logo.png',
                        height: 200,
                        width: 200,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    !islogin
                        ? TextFormField(
                            key: const ValueKey('Username'),
                            validator: (value) {
                              if (value.toString().length < 4) {
                                return 'username too small';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                username = value!;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'username',
                              hintText: 'Enter your username',
                              prefixIcon: const Icon(Icons.email),
                              filled: true,
                              fillColor: Colors.grey[200], // Background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Rounded corners
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors
                                        .blueAccent), // Border when focused
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors
                                        .red), // Border when there's an error
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorStyle: const TextStyle(
                                  color: Colors.red), // Style for error text
                            ),
                          )
                        : Container(),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      key: const ValueKey('email'),
                      validator: (value) {
                        if (!(value.toString().contains('@'))) {
                          return 'invalid email';
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          email = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        prefixIcon: const Icon(Icons.email),
                        filled: true,
                        fillColor: Colors.grey[200], // Background color
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // Rounded corners
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueAccent), // Border when focused
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color:
                                  Colors.red), // Border when there's an error
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorStyle: const TextStyle(
                            color: Colors.red), // Style for error text
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      key: const ValueKey('password'),
                      validator: (value) {
                        if (value.toString().length < 8) {
                          return 'Password must contains minimum 8 characters';
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          password = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        prefixIcon: const Icon(Icons.email),
                        filled: true,
                        fillColor: Colors.grey[200], // Background color
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // Rounded corners
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueAccent), // Border when focused
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color:
                                  Colors.red), // Border when there's an error
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorStyle: const TextStyle(
                            color: Colors.red), // Style for error text
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: MaterialButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            !islogin
                                ? allowLogin = signUpFunction(email, password)
                                : allowLogin = signInFunction(email, password);

                            if (await allowLogin) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            } else {
                              print('dont allow to login');
                            }
                          }
                        },
                        color: Colors.blueAccent, // Button color
                        textColor: Colors.white, // Text color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // Rounded corners
                        ),
                        child: !islogin
                            ? const Text(
                                'Sign In',
                                style: TextStyle(fontSize: 18.0),
                              )
                            : const Text('Login'),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextButton(
                        onPressed: () {
                          islogin = !islogin;
                          setState(() {});
                        },
                        child: !islogin
                            ? const Text("Already Signed up? login")
                            : const Text("don't have an account? sign up")),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed:()async{

                         await signInWithGoogle();


                           Navigator.pushReplacement(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => const HomePage()));


                        },
                        style: ElevatedButton.styleFrom(

                          foregroundColor: Colors.black, backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.blue,width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                          )
                          ,

                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/google.png', // Replace with your image asset
                              height: 30.0,
                            ),
                            const SizedBox(width: 10.0),
                            const Text('Sign in with Google',style: TextStyle(color: Colors.blueAccent,fontSize: 16,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40,),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
