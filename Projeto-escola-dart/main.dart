import 'dart:io';
import 'class.dart';
import 'list.dart';
import 'crudAlunos.dart';
import 'crudProfs.dart';
import 'crudDisciplinas.dart';

void main() {
  // Função Principal
  int opcao; // VAR DE OPÇÃO
  // int qtdAluno = 0; //VAR para contagem de Aluno
  do {
    print("\n MENU - Principal - Projeto Escola");
    print("1 - Alunos");
    print("2 - Professores");
    print("3 - Disciplinas");
    print("0 - Sair");
    print('Digite uma opção: ');

    opcao = int.parse(stdin.readLineSync()!);
    switch (opcao) {
      case 0:
        print("Saindo do Sistema...");
        break;
      case 1:
        print("Exibindo módulo Alunos");
        crudAlunos(); // Não esqueça dos Parâmetros
        break;
      case 2:
        print("Exibindo módulo Professores");
        crudProfessores(); // Não esqueça dos Parâmetros
        break;
      case 3:
        print("Exibindo módulo Disciplinas");
       // crudDisciplinas(); // Não esqueça dos Parâmetros
        break;
      default:
        print("Opção inexistente");
    }
  } while (opcao != 0);
}

int menuCrudAlunos() {
  // MENU ALUNO
  final int opcao;

  print("1 - Listar todos os alunos");
  print("2 - Adicionar novo aluno");
  print("3 - Atualizar dados de um aluno");
  print("4 - Remover um aluno");
  print("0 - Voltar ao Menu Principal");

  print('Digite uma opção: ');
  // Recebe valor e armazena na var:opcao
  opcao = int.parse(stdin.readLineSync()!);
  return opcao; // Função menuCrudAlunos retorna opcao
}

int menuCrudProf() {
  final int opcao;
  print("1 - Listar todos os Professores");
  print("2 - Adicionar novo professor");
  print("3 - Atualizar dados de um professor");
  print("4 - Remover um professor");
  print("0 - Menu Principal");

  print('Digite uma opção: ');
  // Recebe valor e armazena em "opcao"
  opcao = int.parse(stdin.readLineSync()!); // Recebe valor e armazena em "opcao"
  return opcao;
}

int menuCrudDisciplinas() {
  final int opcao;

  print("1 - Listar todas as disciplinas");
  print("2 - Adicionar nova disciplina");
  print("3 - Atualizar dados de uma disciplina");
  print("4 - Remover uma disciplina");
  print("0 - Menu Principal");

  print('Digite uma opção: ');
  opcao = int.parse(stdin.readLineSync()!); // Recebe e armazena valor
  return opcao;
}
