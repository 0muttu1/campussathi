import "package:firebase_auth/firebase_auth.dart" show User;
import "package:flutter/material.dart";

//creating a class for user to verify the user email

@immutable //cant be changed
class AuthUser {
  final bool isEmailVerified;
  const AuthUser({required this.isEmailVerified});

  factory AuthUser.fromFirebase(User user) =>
      AuthUser(isEmailVerified: user.emailVerified);
}
