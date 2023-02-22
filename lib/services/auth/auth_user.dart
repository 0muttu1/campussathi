import "package:firebase_auth/firebase_auth.dart" show User;
import "package:flutter/material.dart";

//creating a class for user to verify the user email

@immutable //cant be changed
class AuthUser {
  final String? email;
  final bool isEmailVerified;
  const AuthUser({
    required this.email,
    required this.isEmailVerified,
  });

  factory AuthUser.fromFirebase(User user) =>
      //AuthUser(isEmailVerified: user.emailVerified);
      //factory AuthUser.fromFirebase(User user) {

      AuthUser(
        email: user.email,
        isEmailVerified: user.emailVerified,
      );

  get emailVerified => isEmailVerified;

  reload() {}
}
