//  } while (opcao != 0);
import 'crudProfs.dart';
import 'list.dart';
import 'class.dart';
import 'main.dart';
import 'dart:io';

void crudDisciplinas() {
  // Crud das Disciplinas
  int opcao = menuCrudDisciplinas();
  do {
    switch (opcao) {
      case 1: // Listar todas as disciplinas
        if (disciplinas.isNotEmpty) {
          print("Listando as disciplinas cadastradas...");
          for (var disciplina in disciplinas) {
            print(disciplinas.toString); // Imprimir tostring das disciplinas
          
          }
        }
        break;
      case 2: // Adcionar nova disciplina
        print("Para adcionar nova disciplina digite:");
        print("Nome da Disciplina");
        print("Código da Disciplina");
        int codigo = int.parse(stdin.readLineSync()!);
        print("Semestre");
        int semestre = int.parse(stdin.readLineSync()!);
        print("Professor");
        String nome = stdin.readLineSync()!;
        break;
        
    }
  } while (opcao != 0);
}
