import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_ref_app/provider/firebase_provider.dart';

final textStateProvider = StateNotifierProvider<TextState, dynamic>((ref) {
  return TextState(ref);
});

class TextState extends StateNotifier<dynamic> {
  // Refを使うと他のファイルのProviderを呼び出せる
  // Riverpod2.0以前は、Reader _readerと書いていた。
  final Ref _ref;
  // superは、親クラスのコンストクラスターを呼び出す
  TextState(this._ref) : super([]);
  // FireStoreにデータを追加するメソッド
  Future<void> textAdd(String text) async {
    // _ref.read()と書いて、firebaseProviderを呼び出す
    final ref = await _ref
        .read(firebaseProvider)
        .collection('users')
        .add({'text': text});
  }
}
