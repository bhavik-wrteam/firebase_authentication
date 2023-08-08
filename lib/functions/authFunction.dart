import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

Future<bool> signUpFunction(String emailAddress, String password) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    return true;
    print('///////// Signed up success  ////////');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> signInFunction(String email, String password) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    print('///////// logged in success  ////////');
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      return false;
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      return false;
    }
    return false;
  }
}

Future<bool> signInWithGoogle() async {
  print('executing signin');
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  final UserCredential userCredential =
      await (auth.signInWithCredential(credential));
  print('executed signin');
  return true;
}
/*

  Future<FirebaseUser> signInWithGoogle(SignInViewModel model) async {
    model.state =ViewState.Busy;
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    AuthResult authResult = await _auth.signInWithCredential(credential);
    _user = authResult.user;
    assert(!_user.isAnonymous);
    assert(await _user.getIdToken() != null);
    FirebaseUser currentUser = await _auth.currentUser();
    assert(_user.uid == currentUser.uid);
    model.state =ViewState.Idle;
    print("User Name: ${_user.displayName}");
    print("User Email ${_user.email}");
  }
}
*/
