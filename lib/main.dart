import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

main(){
  runApp(
      MaterialApp(home: apiconsume()),
  );
}

final String url = 'https://ipdoserver:4000/api/tst';

Future<void> fetchData() async {

  Fluttertoast.showToast(
      msg: "Ligando ou desligando...",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[600],
      textColor: Colors.white,
      fontSize: 16.0
  );

  final response = await http.get(Uri.parse(url));

  Fluttertoast.showToast(
      msg: 'O status foi ' + response.statusCode.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[600],
      textColor: Colors.white,
      fontSize: 16.0
  );

  print(response.statusCode);
  if (response.statusCode == 200) {
    Fluttertoast.showToast(
        msg: "Ligando ou Desligando! Espere um pouco até que a magica aconteça!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[600],
        textColor: Colors.white,
        fontSize: 16.0
    );

    print(response.body);
  } else {
    // Houve um erro ao receber os dados
    print('Erro ao receber os dados: ${response.statusCode}');

    Fluttertoast.showToast(
        msg: "Ocorreu um erro comum ao executar, tente novamente por favor!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[600],
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
class apiconsume extends StatelessWidget {
  const apiconsume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(
                'assets/mainapp.png',
            )
          ),
          Container(
            child: Center(
              child: ElevatedButton(
                onPressed: fetchData,
                child: Text(
                    'Ligar ou desligar Studio',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
