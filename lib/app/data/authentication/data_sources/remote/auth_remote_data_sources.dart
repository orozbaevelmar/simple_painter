import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_painter/app/data/authentication/models/login_model.dart';
import 'package:simple_painter/app/data/authentication/models/register_model.dart';
import 'package:simple_painter/shared/error/exception.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> register(RegisterModel registerModel);
  Future<UserCredential> login(LoginModel loginModel);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required FirebaseAuth firebaseAuth})
    : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  Future<UserCredential> login(LoginModel loginModel) async {
    try {
      await _firebaseAuth.currentUser?.reload();
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ExistedAccountException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordException();
      } else {
        throw ServerException(e.toString());
      }
    }
  }

  @override
  Future<UserCredential> register(RegisterModel registerModel) async {
    try {
      await _firebaseAuth.currentUser?.reload();

      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: registerModel.email,
            password: registerModel.password,
          );
      User? user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(registerModel.firstName);
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeekPassException();
      } else if (e.code == 'email-already-in-use') {
        throw ExistedAccountException();
      } else {
        throw ServerException();
      }
    }
  }
}
