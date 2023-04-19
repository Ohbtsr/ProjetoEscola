import 'main.dart';
import 'list.dart';
import 'class.dart';
import 'dart:io';
import 'valid.dart';

void crudAlunos() {
  // Não esqueça dos parâmetros
  int opcao = menuCrudAlunos();
  do {
    // Este código será repetido infinitamente
    switch (opcao) {
      case 1: // LISTAR ALUNOS
        if (alunos.isNotEmpty) {
          // Ação boolena confere lista vazia
          print("Listando todos os alunos");
          for (var aluno in alunos) {
            // FOR procura aluno na lista alunos
            print(aluno.toString());
          //  menuCrudAlunos();
            opcao = 0;
          }
        } else {
          print("Nenhum aluno cadastrado.");
        }
        break;

      case 2: // Adcionar Novo aluno
        print("Preencha as informações solicitadas");
        int matricula = alunos.length + 1;

        print("Digite o nome do aluno:");
        String nome = stdin.readLineSync()!;

        print("Digite sexo do aluno:");
        String sexo = " ";
        do {
          sexo = stdin.readLineSync()!;
          if (!verifGenero(sexo)) {
            print("Gênero não definido no programa");
          }
        } while (!verifGenero(sexo));

        print("Digite a data de nascimento do aluno: (DD/MM/AAAA)");
        String nascimento = stdin.readLineSync()!;

        String cpf_p = " ";
        int existe = 0;
        do {
          existe = 0;
          print("Digite o cpf do aluno:");
          cpf_p = stdin.readLineSync()!; // Recebe com ou sem pontos.
          if (validarCPF(cpf_p)) {
            // Se a validação for TRUE

            int cpf = int.parse(cpf_p.replaceAll(RegExp('[^0-9]'), '')); // Retira pontos e traços
            if(alunos.where((a) => a.cpf == cpf).isNotEmpty){
              print("CPF utilizado por outro aluno.");
              existe = 1;
            } else {
                Aluno novoAluno = Aluno(nome, sexo, nascimento, matricula,
                cpf); // Preenche o construtor
            alunos.add(novoAluno); // Adciona na lista.
            print("A matrícula do novo aluno será: $matricula");
            print("Aluno adicionado com sucesso!");
            opcao = 0;  
            } 
          } else {
            // Quando a validação retorna false
            print("Cpf Inválido");
          }
        } while (!validarCPF(cpf_p) || existe==1 ); // Repetição enquanto é verdadeira.
        break;

      case 3: // Atualizar Aluno

        if (alunos.isNotEmpty) {
          // Se lista não tiver vaiza:
          print("Para atualizar um aluno, digite o número da matrícula");

          //  Buscar aluno:
          int matricula = int.parse(stdin.readLineSync()!);
          var aluno =
              alunos.firstWhere((aluno) => aluno.matricula == matricula);

          // Após procurar o aluno, receber dados de atualização:

          print("Atualização de cadastro matrícula do(a)  ${aluno.nome} ");
          print("Digite nome do aluno:");
          String nome = stdin.readLineSync()!;

          print("Digite sexo do aluno:");
          String sexo = " ";
        do {
          sexo = stdin.readLineSync()!;
          if (!verifGenero(sexo)) {
            print("Gênero não definido no programa");
          }
        } while (!verifGenero(sexo));

          print("Digite a data de nascimento do aluno: (DD/MM/AAAA)");
          String nascimento = stdin.readLineSync()!;

          // Inserindo os dados na Lista
          aluno.nome = nome;
          aluno.sexo = sexo;
          aluno.nascimento = nascimento;
          print("Aluno atualizado com sucesso, confira: ${aluno.toString()}");
        }
        opcao =0;
        break;

      case 4: // Remover
        
        if (alunos.isNotEmpty) {
          // REMOÇÃO DE UM ALUNO COM MÉTODO removeWhere
          print("Digite a matrícula do aluno a ser removido: ");
          int contListainicial = alunos.length; 
          var matricula = int.parse(stdin.readLineSync()!);
          //método removeWhere para remover todos os elementos da lista alunos que satisfaçam a condição.
          alunos.removeWhere((aluno) => aluno.matricula == matricula);
          // A condição : valor da propriedade matricula do objeto aluno seja igual ao valor recebido na variável matricula.

          int contListaFinal = alunos.length;  
          if (contListaFinal < contListainicial) {
            print("Aluno removido com sucesso.");
            opcao = 0;
          } // Método IF com length para comparar tamanho da lista antes e depois
          else {
            print('Matrícula inválida');
          }
        } else {
          // Se não: Lista está vazia
          print("Nenhum aluno cadastrado. Para Adcionar tecle '2' ");
          
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