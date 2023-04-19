import 'class.dart';

List<Aluno> alunos = [
  Aluno('Lindomar', 'M', '19/03/2000', 0001,03068022525),
  Aluno('Heloiza', 'F', '04/02/1992', 0002,04551183024),
];

List<Professor> professores = [
  Professor(1000, 'Louise', 'F', '05/09/1980', 68825990090),
  Professor(1001, 'Marizete', 'F', '04/06/1975', 77178391057),
];

List<Disciplina> disciplinas = [
  Disciplina('Matemática', 01, 1, professores[0]),
  Disciplina('Português', 02, 1, professores[1]),
];
