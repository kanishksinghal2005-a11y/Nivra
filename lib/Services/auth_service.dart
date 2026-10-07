import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  /// Register user using Email and Password
  Future<UserCredential> registerUser({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    // Create Firebase Authentication account
    UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Save additional user information in Firestore
    await _firestore
        .collection('users')
        .doc(userCredential.user!.uid)
        .set({
      'uid': userCredential.user!.uid,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'createdAt': FieldValue.serverTimestamp(),
    });

    return userCredential;
  }

  /// Login user using Email and Password
  Future<UserCredential> loginUser({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Login user using Google
  Future<UserCredential> loginWithGoogle() async {
    final GoogleSignIn googleSignIn =
        GoogleSignIn.instance;

    // Start Google authentication
    final GoogleSignInAccount googleUser =
        await googleSignIn.authenticate();

    // Get Google authentication information
    final GoogleSignInAuthentication googleAuth =
        googleUser.authentication;

    // Create Firebase credential
    final AuthCredential credential =
        GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    // Sign in to Firebase
    final UserCredential userCredential =
        await _auth.signInWithCredential(
      credential,
    );

    // Get Firebase user
    final User? user = userCredential.user;

    if (user != null) {
      final DocumentReference userDocument =
          _firestore
              .collection('users')
              .doc(user.uid);

      final DocumentSnapshot document =
          await userDocument.get();

      // Create Firestore document for a new Google user
      if (!document.exists) {
        await userDocument.set({
          'uid': user.uid,
          'fullName': user.displayName ?? 'User',
          'email': user.email ?? '',
          'phone': user.phoneNumber ?? '',
          'profileImage': user.photoURL ?? '',
          'createdAt':
              FieldValue.serverTimestamp(),
        });
      }
    }
        return userCredential;
  }

  /// Reset password
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(
      email: email,
    );
  }

  /// Logout
  Future<void> logout() async {
    await _auth.signOut();

    // Also sign out from Google
    await GoogleSignIn.instance.signOut();
  }

  /// Get currently logged-in user
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}