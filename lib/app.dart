import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/data/Http/http_client.dart';
import 'package:flutter_application_1/data/Repository/model_repository.dart';
import 'package:flutter_application_1/features/inital.dart';
import 'package:flutter_application_1/features/stores/model_store.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  final ModelStore store = ModelStore(
    repository: ModelRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addObserver(this); // Adiciona o observer para ciclo de vida
    _enableImmersiveMode();
    store.getModels(); // Ativa o modo imersivo no início
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Remove o observer ao sair
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Ativa o modo imersivo automaticamente ao voltar para o app
      _enableImmersiveMode();
    }
  }

  void _enableImmersiveMode() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    // Redefine o modo imersivo após 2 segundos para ocultar a barra novamente
    Future.delayed(const Duration(seconds: 2), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [MyNavigatorObserver()],
      home: GestureDetector(
        onTap: () {
          // Oculta o teclado ao tocar fora do campo e ativa o modo imersivo
          FocusManager.instance.primaryFocus?.unfocus();
          _enableImmersiveMode();
        },
        child: const Initial(),
      ),
    );
  }
}

// NavigatorObserver personalizado para detectar navegação entre telas
class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }
}
