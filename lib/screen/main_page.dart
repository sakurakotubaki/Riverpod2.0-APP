import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_ref_app/provider/firebase_provider.dart';
import 'package:riverpod_ref_app/state/text_state.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // textProviderを呼び出す定数を定義
    final controllerProvider = ref.watch(textProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod2.0'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controllerProvider, //providerに定義したコントローラーを使う
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: '文字を入力してください',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    // ref.readでStateNotifierを呼び出す.
                    // controllerProvider.textと書いて
                    ref
                        .read(textStateProvider.notifier)
                        .textAdd(controllerProvider.text);
                  },
                  child: Text('新規登録')),
            ],
          ),
        ),
      ),
    );
  }
}
