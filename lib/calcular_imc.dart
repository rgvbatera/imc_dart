import 'dart:io';

class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa(this.nome, this.peso, this.altura);

  double calcularIMC() {
    if (altura <= 0) {
      throw ArgumentError('A altura deve ser maior que zero.');
    }
    return peso / (altura * altura);
  }
}

void main() {
  try {
    stdout.write('Digite seu nome: ');
    String nome = stdin.readLineSync()!;

    stdout.write('Digite seu peso em quilogramas: ');
    double peso = double.parse(stdin.readLineSync()!);

    stdout.write('Digite sua altura em metros: ');
    double altura = double.parse(stdin.readLineSync()!);

    var pessoa = Pessoa(nome, peso, altura);
    double imc = pessoa.calcularIMC();

    print('Nome: ${pessoa.nome}');
    print('Peso: ${pessoa.peso} kg');
    print('Altura: ${pessoa.altura} m');
    print('IMC: $imc');

    if (imc < 16) {
      print('Magreza GRAVE, cuidado!');
    } else if (imc < 17) {
      print('Magreza MODERADA');
    } else if (imc < 18.5) {
      print('Magreza leve');
    } else if (imc < 25) {
      print('Saudável!, continue assim');
    } else if (imc < 30) {
      print('Você está com SOBREPESO.');
    } else if (imc < 35) {
      print('OBESIDADE GRAU I');
    } else if (imc < 40) {
      print('OBESIDADE GRAU II (Severa)');
    } else {
      print('OBESIDADE GRAU III (Mórbida)');
    }
  } catch (e) {
    print('Erro: $e');
  }
}
