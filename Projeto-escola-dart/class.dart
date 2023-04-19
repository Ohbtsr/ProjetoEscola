import 'list.dart';

class Aluno {
  // Classe Aluno com parâmetros
  String nome;
  String sexo;
  String nascimento;
  int matricula;
  int cpf;
// Linha de construtor aluno
  Aluno(this.nome, this.sexo, this.nascimento, this.matricula, this.cpf);
  @override
  String toString() {
    return 'Aluno: nome: $nome, sexo: $sexo, data de nascimento: $nascimento, matrícula: $matricula, CPF: $cpf ';
  }
}

class Professor {
  int matricula;
  String nome;
  String sexo;
  String nascimento;
  int cpf;

// Linha de construtor
  Professor(this.matricula, this.nome, this.sexo, this.nascimento, this.cpf);

  @override
  String toString() {
    return 'Professor:  nome: $nome, sexo: $sexo, data de nascimento: $nascimento, matrícula: $matricula, CPF: $cpf ';
  }
}

class Disciplina {
  String nome;
  int codigo;
  int semestre;
  Professor professor;
  List<Aluno> alunos = [];

// Linha de construtor
  Disciplina(this.nome, this.codigo, this.semestre, this.professor);
  @override
  String toString() {
    return 'Disciplina:  nome: $nome, código: $codigo, int: $semestre, professor: $professor ';
  }
}
