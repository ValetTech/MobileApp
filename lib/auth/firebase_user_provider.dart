import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ValetFirebaseUser {
  ValetFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ValetFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ValetFirebaseUser> valetFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ValetFirebaseUser>(
      (user) {
        currentUser = ValetFirebaseUser(user);
        return currentUser!;
      },
    );
