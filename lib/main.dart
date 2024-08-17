import 'package:flutter/material.dart';       // Biblioteca 'material'

void main() => runApp(const ProjetoTeste());   // Função principal 'void' não retorna nada

class ProjetoTeste extends StatelessWidget {      // Criando um 'widget'
  const ProjetoTeste({super.key});

  @override   // Classe que define o aplicativo
  Widget build(BuildContext context) {        // Função 'build' significa construir (coloca algo na tela)
    return MaterialApp(     // Retorna o widget MaterialApp que define o aplicativo
      title: 'Teste',          // Título do aplicativo
      theme: ThemeData(         // Tema do aplicativo
        primarySwatch: Colors.blue,             // Cor primária
      ),
      home: MyHomePage(),           // Página inicial do aplicativo
    );
  }
}

class MyHomePage extends StatefulWidget {   // Classe que define a página inicial
  
  @override     // Construtor da classe
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  double _saldo = 0.0;    // Variável que armazena o 'saldo' atual
  bool _showSaldo = true;     // Variável que armazena a 'visibilidade' do saldo

  final _depositoController = TextEditingController();    // Controladores para os campos de texto
  final _saqueController = TextEditingController();

  void _depositar(double valor) {     // Função que deposita um valor no saldo    
    setState(() {
      _saldo += valor;
    });
  }

  
  void _sacar(double valor) {     // Função que saca    
    setState(() {
      _saldo -= valor;
    });
  }

  
  void _toggleSaldo() {     // Função alterna a 'visibilidade' do saldo
    setState(() {
      _showSaldo = !_showSaldo;
    });
  }

  @override     // Construtor da classe
  Widget build(BuildContext context) {
    return Scaffold(      // Retorna o widget Scaffold que 'define' a página
      
      appBar: AppBar(        
        title: Text('Conta Bancária'),      // Título da barra de aplicativos
      ),
      body: Padding(    // Corpo da página        
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Visibility(     // Visibilidade do saldo              
              visible: _showSaldo,
              child: Text(
                'Saldo: R\$ ${_saldo.toStringAsFixed(2)}',      // Texto que mostra o saldo                
                style: TextStyle(fontSize: 24.0),
              ),
            ),            
            SizedBox(height: 20.0),
            Row(    // Linha que contém os campos de texto e botões              
              children: [
                Expanded(     // Campo de texto para entrada de valor de 'deposito'              
                  child: TextField(
                    controller: _depositoController,
                    decoration: InputDecoration(
                      labelText: 'Depositos',     // Rótulo do campo de texto                      
                      border: OutlineInputBorder(),     // Borda do campo de texto
                    ),
                    
                    keyboardType: TextInputType.number,     // Tipo de teclado
                  ),
                ),                
                SizedBox(width: 10.0),
                
                ElevatedButton(   // Botão para depositar
                  
                  onPressed: () {            // Função que é executada quando o botão é pressionado 
                    final valor = double.tryParse(_depositoController.text);      // Obtém o valor do campo de texto
                    if (valor != null) {
                      _depositar(valor);
                      _depositoController.clear();
                    }
                  },                  
                  child: Text('Depositar'),     // Filho do botão
                ),
              ],
            ),
            
            SizedBox(height: 20.0),
            
            Row(
              
              children: [                
                Expanded(     // Campo de texto para entrada de valor para 'saque'
                  child: TextField(
                    controller: _saqueController,
                    decoration: InputDecoration(
                      labelText: 'Saques',                      
                      border: OutlineInputBorder(),
                    ),                    
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10.0),
                
                ElevatedButton(     // Botão para sacar                  
                  onPressed: () {                    
                    final valor = double.tryParse(_saqueController.text);
                    if (valor != null) {
                      _sacar(valor);
                      _saqueController.clear();
                    }
                  },
                  child: Text('Sacar'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            
            ElevatedButton(     // Botão que alterna a visibilidade do saldo
              onPressed: _toggleSaldo,
              child: Text(_showSaldo ? 'Ocultar Saldo' : 'Mostrar Saldo'),
            ),
          ],
        ),
      ),
    );
  }
}
