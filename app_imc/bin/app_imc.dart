import 'dart:convert';
import 'dart:io';

import 'package:app_imc/app_imc.dart';
import 'package:app_imc/calculadora_imc.dart';
import 'package:app_imc/indice_imc.dart';

void main(List<String> arguments) {
  //Cria as variáveis de entrada
  String? nome;
  var idade = "";
  var peso = "";
  var altura = "";
  bool valida = true;

  nome = (lerConsole("Digite o nome:"));

  //testa se recebe int
  while (valida) {
    valida = false;
    try {
      int idadelida = int.parse(lerConsole("Digite a idade:"));
      idade = idadelida.toString();
    } catch (e) {
      print("Idade inválida! Digite novamente!");
      valida = true;
    }
  }
  valida = true;

  //testa se recebe double
  while (valida) {
    valida = false;
    try {
      double pesolida = double.parse(lerConsole("Digite o peso em 'kg':"));
      peso = pesolida.toString();
    } catch (e) {
      print("Peso inválido! Digite novamente!");
      valida = true;
    }
  }
  valida = true;

  //testa se recebe int - altura em cm
  while (valida) {
    valida = false;
    try {
      int alturalida = int.parse(lerConsole("Digite a altura em 'cm':"));
      altura = alturalida.toString();
    } catch (e) {
      print("Altura inválida! Digite novamente!");
      valida = true;
    }
  }
  valida = true;

  //Cria instância de DadosInt e armazena as informações
  DadosImc calc1 = DadosImc(nome, idade, peso, altura);

  // Imprime as informações da instância
  print(calc1);

  //Envia os dados para a função calculo na Classe CalculadoraImc
  var imc = CalculadoraImc().calculo(idade, peso, altura);
  print("Seu IMC é: $imc");
  Indice().imc(imc);
}

//Função ler console
lerConsole(texto) {
  print(texto);
  var ler = stdin.readLineSync(encoding: utf8) ?? "";
  return (ler);
}
