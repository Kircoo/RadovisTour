import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radovis_tour/helpers/waiting_screen.dart';
import 'package:radovis_tour/provider/sign_in_google_provider.dart';
import 'package:radovis_tour/widgets/categories/categories_screen.dart';

class SignInUser extends StatefulWidget {
  static const routeName = '/signIn';
  @override
  _SignInUserState createState() => _SignInUserState();
}

class _SignInUserState extends State<SignInUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          final isSignedIn = Provider.of<SignInGoogleProvider>(context);
          if (isSignedIn.isSignedIn) {
            return WaitingScreen();
          } else if (snapshot.hasData) {
            return CategoriesScreen();
          } else {
            return Container(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Container(
                  height: 350,
                  width: 200,
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/radovislogo1.png'),
                      InkWell(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          elevation: 20,
                          color: Colors.white,
                          splashColor: Colors.greenAccent,
                          onPressed: () async {
                            await Provider.of<SignInGoogleProvider>(context,
                                    listen: false)
                                .signInWithGoogle();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.email),
                              Text('Sign in with Gmail')
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          elevation: 20,
                          color: Colors.white,
                          splashColor: Colors.greenAccent,
                          child: Text('Continue without account', style: TextStyle(fontSize: 13),),
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                CategoriesScreen.routeName, (route) => false);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
