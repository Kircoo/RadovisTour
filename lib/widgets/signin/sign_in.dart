import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radovis_tour/provider/sign_in_google_provider.dart';

class SignInUser extends StatefulWidget {
  static const routeName = '/signIn';
  @override
  _SignInUserState createState() => _SignInUserState();
}

class _SignInUserState extends State<SignInUser> {
  User theSignedUser;
  @override
  void initState() {
    theSignedUser =
        Provider.of<SignInGoogleProvider>(context, listen: false).theSingedUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Container(
              height: 300,
              width: 200,
              color: Theme.of(context).primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/radovislogo1.png'),
                  theSignedUser == null
                      ? Text('prazno')
                      : Text(theSignedUser.displayName),
                  theSignedUser != null
                      ? InkWell(
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
                                  .signOutGoogle()
                                  .then((value) {
                                setState(() {
                                  theSignedUser = null;
                                });
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [Icon(Icons.email), Text('Sign out')],
                            ),
                          ),
                        )
                      : InkWell(
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
                                  .signInWithGoogle()
                                  .then((value) {
                                setState(() {
                                  theSignedUser = value;
                                  theSignedUser.getIdToken().then(
                                      (value) => print('hehehehe $value'));
                                });
                              });
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
                ],
              ),
            ),
          )),
    );
  }
}
