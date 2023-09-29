import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pessoas = 0;
  bool isFull = false;
  void decrement() {
    if (pessoas > 0) {
      setState(() {
        pessoas--;
      });
    }
  }

  void increment() {
    setState(() {
      pessoas++;
    });
  }

  String getStatusText(int pessoas) {
    verifyIfIsFull();
    return pessoas < 20 ? 'Pode entrar!' : 'Lotado!';
  }

  verifyIfIsFull() {
    if (pessoas < 20) {
      setState(() {
        isFull = false;
      });
    } else {
      setState(() {
        isFull = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //WIDGET PADRÃO
    return Scaffold(
        backgroundColor: Colors.white,
        //AQUI VAI O CORPO DA TELA
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/example.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            //ALINHAMENTO DA COLUNA
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //PRIMEIRO TEXTO
              Text(
                getStatusText(pessoas),
                style: TextStyle(
                    color: isFull ? Colors.red : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const SizedBox(height: 15),
              //SEGUNDO TEXTO
              Text(
                pessoas.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.red),
              ),
              const SizedBox(height: 15),
              //LINHA
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //BOTOES
                  TextButton(
                    onPressed: decrement,
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: const Size(100, 100)),
                    child: const Text(
                      'Saiu',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: increment,
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: const Size(100, 100)),
                    child: const Text(
                      'Entrou',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
