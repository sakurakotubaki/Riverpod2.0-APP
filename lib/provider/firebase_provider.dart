import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Firebaseを使うためのProvider
final firebaseProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

// StateProvider は外部から変更が可能なステート（状態）を公開するプロバイダです。
// TextEditingControllerを使うためのProvider
final textProvider = StateProvider.autoDispose((ref) {
  // riverpodで使うには、('')が必要
  return TextEditingController(text: '');
});
