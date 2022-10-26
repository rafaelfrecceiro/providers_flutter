import 'package:flutter/material.dart';
import 'package:flutter_provider/change_notifier/provider_controller.dart';
import 'package:provider/provider.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({super.key});

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      context.read<ProviderController>().alterarDados();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Selector<ProviderController, String>(
                selector: (p0, p1) {
                  return p1.imgAvatar;
                },
                builder: (context, value, child) {
                  return CircleAvatar(
                    backgroundImage: NetworkImage(value),
                    radius: 60,
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Selector<ProviderController, String>(
                    selector: (p0, p1) {
                      return p1.name;
                    },
                    builder: (context, value, child) {
                      return Text(value);
                    },
                  ),
                  Selector<ProviderController, String>(
                    selector: (p0, p1) {
                      return p1.birthDate;
                    },
                    builder: (context, value, child) {
                      return Text(' ($value)');
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<ProviderController>().alterarNome();
                },
                child: const Text('Alterar Nome para Xablauzinnn'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
