import 'list.dart';
import 'class.dart';
//  VALIDADOR DE CPF , GÊNERO E NASCIMENTO 

bool validarCPF(String cpf_p) {
  // Remove pontos e traço do CPF
  String cpfSemPontos = cpf_p.replaceAll(RegExp('[^0-9]'), '');

  // Verifica se o CPF possui 11 dígitos
  if (cpfSemPontos.length != 11) {
    return false;
  }

  // Verifica se todos os dígitos são iguais
  if (RegExp(r'^(\d)\1*$').hasMatch(cpfSemPontos)) {
    return false;
  }

  // Etapa 1: cálculo do primeiro dígito verificador
  int soma = 0;
  for (int i = 0; i < 9; i++) {
    int digito = int.parse(cpfSemPontos[i]);
    int peso = 10 - i;
    int resultado = digito * peso;
    soma += resultado;
  }
  int resto = (soma * 10) % 11;
  int digitoVerificador1 = (resto == 10) ? 0 : resto;

  // Etapa 2: cálculo do segundo dígito verificador
  soma = 0;
  for (int i = 0; i < 10; i++) {
    int digito = int.parse(cpfSemPontos[i]);
    int peso = 11 - i;
    int resultado = digito * peso;
    soma += resultado;
  }
  resto = (soma * 10) % 11;
  int digitoVerificador2 = (resto == 10) ? 0 : resto;

  // Verifica se os dígitos verificadores são válidos
  if (int.parse(cpfSemPontos[9]) != digitoVerificador1 ||
      int.parse(cpfSemPontos[10]) != digitoVerificador2) {
    return false;
  }

  // Se chegou até aqui, o CPF é válido
  return true;
}

// VERIFICADOR GÊNERO F OU M - RETORNA TRUE OR FALSE
  bool verifGenero(String sexo) {
  return sexo == "F" || sexo == "M" || sexo == "f" || sexo == "m" ;
  }

