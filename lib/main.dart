import 'package:flutter/material.dart';     // biblioteca 'material'

void main() => runApp(const ProjetoTeste());    // função principal 'void' não retorna nada

class ProjetoTeste extends StatelessWidget {    // criando um 'widget'
  const ProjetoTeste({super.key});

  @override
  Widget build(BuildContext context) {      // função 'build' significa construir (coloca algo na tela)
    return MaterialApp(      // Retorna o widget MaterialApp que define o aplicativo
      title: 'Teste',     // Título 
      theme: ThemeData(     
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),     // Página inicial do
    );
  }
}

class MyHomePage extends StatefulWidget {     // Classe que define a página inicial
  @override
  _MyHomePageState createState() => _MyHomePageState();     // Construtor da classe
}

class _MyHomePageState extends State<MyHomePage> {
  double _saldo = 0.0;      // Variável que armazena o saldo

  final _depositoController = TextEditingController();      // Controlador para o campo de texto de depósito
  final _saqueController = TextEditingController();       // Controlador para o campo de texto de saque

  void _depositar(double valor) {     // Função que deposita 
    setState(() {     // Atualiza o saldo
      _saldo += valor;
    });
  }

  void _sacar(double valor) {     // Função que saca um valor do saldo
    setState(() {     // Atualiza o saldo
      _saldo -= valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      // Retorna o widget Scaffold que define a página
      appBar: AppBar(
        title: Text('Conta Bancária'),      // Título da barra de aplicativos
      ),
      body: Padding(      // Corpo da página
        padding: const EdgeInsets.all(20.0),     // Espaçamento entre os widgets
        child: Column(    
          children: [  
            Row(      // Linha que contém os campos de texto e botões
              children: [
                Expanded(     // Campo de texto para entrada de valor
                  child: TextField(     
                    controller: _depositoController,      // Controlador do campo de texto de depósito
                    decoration: InputDecoration(  
                      labelText: 'Deposito',     // Rótulo do campo de texto
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,  // Tipo de teclado
                  ),
                ),
                SizedBox(width: 10.0),  // Espaçamento
                ElevatedButton(  // Botão para depositar
                  onPressed: () {
                    final valor = double.tryParse(_depositoController.text);
                    if (valor != null) {
                      _depositar(valor);
                      _depositoController.clear();
                    }
                  },
                  child: Text('Depositar'),
                ),
              ],
            ),
            SizedBox(height: 20.0),      // Espaçamento entre os widgets
            Row(      // Linha que contém os campos de texto e botões
              children: [
                Expanded(     // Campo de texto para entrada de valor
                  child: TextField(  
                    controller: _saqueController,      // Controlador do campo de texto de saque
                    decoration: InputDecoration(  
                      labelText: 'Saque',  
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,  // Tipo de teclado
                  ),
                ),
                SizedBox(width: 10.0),  
                ElevatedButton(     // Botão para sacar
                  onPressed: () {
                    final valor = double.tryParse(_saqueController.text);  // Obtém o valor do campo de texto
                    if (valor != null) {
                      _sacar(valor);
                      _saqueController.clear();
                    }
                  },
                  child: Text('Sacar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
