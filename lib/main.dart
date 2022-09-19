
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Calculando Salário'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _salarioHora = TextEditingController();
  final TextEditingController _horasTrabalhadas = TextEditingController();

  String? valor;

  String calculaSalario(double salarioHora, double horasTrabalhadas) {
    var meuSalario = salarioHora * 160;

    if (horasTrabalhadas == 160) {
      return (meuSalario).toString();
    }else if (horasTrabalhadas < 160) {
      return (horasTrabalhadas * salarioHora).toString();
    } else {
      var horasExtras = (horasTrabalhadas - 160) * 1.5;

      var valorTotal = (horasExtras * salarioHora) + meuSalario;

      return valorTotal.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Digite o salário por hora',
              ),
              TextFormField(
                controller: _salarioHora,
              ),
              const Text(
                'Horas Trabalhadas',
              ),
              TextFormField(
                controller: _horasTrabalhadas,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    valor = calculaSalario(double.parse(_salarioHora.text),
                        double.parse(_horasTrabalhadas.text));
                  });
                },
                child: const Text('Calcular'),
              ),
              Text(
                valor ?? 'Resultado da soma',
              ),
            ],
          ),
        ));
  }
}