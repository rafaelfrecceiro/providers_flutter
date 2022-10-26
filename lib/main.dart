import 'package:flutter/material.dart';
import 'package:flutter_provider/change_notifier/change_notifier_page.dart';
import 'package:flutter_provider/change_notifier/provider_controller.dart';
import 'package:flutter_provider/model/user_model.dart';
import 'package:flutter_provider/provider/provider_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) {
            return UserModel(
              name: 'Rafael Frecceiro',
              imgAvatar:
                  'https://store.playstation.com/store/api/chihiro/00_09_000/container/BR/en/99/UP0102-BLUS30855_00-AVARE6LEON000000/0/image?_version=00_09_000&platform=chihiro&bg_color=000000&opacity=100&w=720&h=720',
              birthDate: '12/12/1986',
            );
          },
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderController(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/provider');
                      },
                      child: const Text('Provider'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/change');
                      },
                      child: const Text('Change Notifier'),
                    )
                  ],
                ),
              ),
            );
          },
        ),
        routes: {
          '/provider': (_) => const ProviderPage(),
          '/change': (_) => const ChangeNotifierPage(),
        },
      ),
    );
  }
}
