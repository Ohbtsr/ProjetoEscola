import 'main.dart';
import 'list.dart';
import 'class.dart';
import 'dart:io';
import 'valid.dart';

void crudProfessores() {
  // Não esqueça dos parâmetros
  int opcao = menuCrudProf();
  do {
    // Este código será repetido infinitamente
    switch (opcao) {
      case 1: // LISTAR PROFESSOR
        if (professores.isNotEmpty) {
          // Ação boolena confere lista vazia
          print("Listando todos os professores");
          for (var professor in professores) {
            // FOR procura professor na lista
            print(professor.toString());
            opcao = 0;
          }
        } else {
          print("Nenhum professor cadastrado.");
        }
        break;

      case 2: // Adcionar Novo
        print("Preencha as informações solicitadas");
        int matricula = professores.length + 1;

        print("Digite o nome do professor:");
        String nome = stdin.readLineSync()!;

        print("Digite sexo do professor:");
        String sexo = " ";
        do {
          sexo = stdin.readLineSync()!;
          if (!verifGenero(sexo)) {
            print("Gênero não definido no programa");
          }
        } while (!verifGenero(sexo));

        print("Digite a data de nascimento do professor: (DD/MM/AAAA)");
        String nascimento = stdin.readLineSync()!;

        String cpf_p = " ";
        int existe = 0;
        do {
          existe = 0;
          print("Digite o cpf do professor:");
          cpf_p = stdin.readLineSync()!; // Recebe com ou sem pontos.
          if (validarCPF(cpf_p)) {
            // Se a validação for TRUE

            int cpf = int.parse(cpf_p.replaceAll(
                RegExp('[^0-9]'), '')); // Retira pontos e traços
            if (professores.where((a) => a.cpf == cpf).isNotEmpty) {
              print("CPF utilizado por outro professor.");
              existe = 1;
            } else {
              Professor novoProfessor = Professor(matricula, nome, sexo,
                  nascimento, cpf); // Preenche o construtor
              professores.add(novoProfessor); // Adciona na lista.
              print("A matrícula do novo professor será: $matricula");
              print("Professor adicionado com sucesso!");
              opcao = 0;
            }
          } else {
            // Quando a validação retorna false
            print("Cpf Inválido");
          }
        } while (!validarCPF(cpf_p) ||
            existe == 1); // Repetição enquanto é verdadeira.
        break;

      case 3: // Atualizar

        if (professores.isNotEmpty) {
          // Se lista não tiver vaiza:
          print("Para atualizar um professor, digite o número da matrícula");

          //  Buscar
          int matricula = int.parse(stdin.readLineSync()!);
          var professor = professores
              .firstWhere((professor) => professor.matricula == matricula);

          // Após procurar, receber dados de atualização:

          print("Atualização de cadastro matrícula do(a)  ${professor.nome} ");
          print("Digite nome do professor:");
          String nome = stdin.readLineSync()!;

          print("Digite sexo do professor:");
          String sexo = " ";
          do {
            sexo = stdin.readLineSync()!;
            if (!verifGenero(sexo)) {
              print("Gênero não definido no programa");
            }
          } while (!verifGenero(sexo));

          print("Digite a data de nascimento do professor: (DD/MM/AAAA)");
          String nascimento = stdin.readLineSync()!;

          // Inserindo os dados na Lista
          professor.nome = nome;
          professor.sexo = sexo;
          professor.nascimento = nascimento;
          print(
              "Professor atualizado com sucesso, confira: ${professor.toString()}");
        }
        break;
        opcao = 0;
      case 4: // Remover

        if (professores.isNotEmpty) {
          // REMOÇÃO COM MÉTODO removeWhere
          print("Digite a matrícula do professor a ser removido: ");
          int contListainicial = professores.length;
          var matricula = int.parse(stdin.readLineSync()!);
          //método removeWhere para remover todos os elementos da lista que satisfaçam a condição.
          professores
              .removeWhere((professor) => professor.matricula == matricula);
          // A condição : valor da propriedade matricula do objeto professor seja igual ao valor recebido na variável matricula.

          int contListaFinal = professores.length;
          if (contListaFinal < contListainicial) {
            print("Professor removido com sucesso.");
            opcao = 0;
          } // Método IF com length para comparar tamanho da lista antes e depois
          else {
            print('Matrícula inválida');
          }
        } else {
          // Se não: Lista está vazia
          print("Nenhum professor cadastrado. Para Adcionar tecle '2' ");
        }
        break;

      case 0:
        print("Você escolheu voltar...");
        break;

      default:
        print("Opção inexistente");
    }
  } while (opcao != 0);
}
