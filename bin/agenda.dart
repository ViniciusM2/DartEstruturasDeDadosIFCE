import 'dart:async';
import 'dart:io';

Future<void> main(List<String> arguments) async {
  // List com tipo fixo(definido pelo uso dos generics)
  // e tamanho imutável(definido como parâmetro do construtor),
  // ou seja, um Vetor.
  var agenda = List<Agenda>(10);

  List<String> menuOptions;

  menuOptions = [
    '1 - Inserir na agenda',
    '2 - Consultar na agenda',
    '3 - Excluir da agenda',
    '4 - Listar a agenda',
    '0 - Sair\n\n',
  ];

  clear();
  stdout.writeAll(menuOptions, '\n');
  var op = stdin.readLineSync();
  while (op != '0') {
    clear();
    switch (op) {
      case '1':
        var contato = getContatoFromUserInput();
        for (int i = 0; i < agenda.length; i++) {
          if (agenda[i] == null) {
            agenda[i] = contato;
            break;
          }
        }
        break;
      case '2':
        stdout.write('Consultar na agenda:\n');

        stdout.write('Nome:');

        var nome = stdin.readLineSync();

        Agenda contato;

        stdout.writeln();

        for (int i = 0; i < agenda.length; i++) {
          if (agenda[i]?.nome == nome) {
            contato = agenda[i];
            break;
          }
        }

        if (contato != null) {
          stdout.write(contato);
        } else {
          stdout.write('Contato não cadastrado.');
        }

        break;
      case '3':
        stdout.write('Excluir da agenda:\n');
        stdout.write('Nome:');
        var nome = stdin.readLineSync();

        Agenda contato;
        int posicao;

        stdout.writeln();

        for (int i = 0; i < agenda.length; i++) {
          if (agenda[i]?.nome == nome) {
            contato = agenda[i];
            posicao = i;
            break;
          }
        }

        if (contato != null) {
          stdout.write(contato);

          stdout.write('Deseja mesmo excluir o contato?[S/N]\n');
          var yesOrNo = stdin.readLineSync();
          stdout.writeln();

          if (yesOrNo.toLowerCase().startsWith('s')) {
            for (var i = posicao; i < agenda.length - 1; i++) {
              agenda[i] = agenda[i + 1];
            }

            stdout.write('O contato foi excluído!\n');
          }
        } else {
          stdout.write('Contato não cadastrado.');
        }

        break;
      case '4':
        for (int i = 0; i < agenda.length; i++) {
          if (agenda[i] != null) {
            stdout.write(agenda[i]);
            stdout.write('====================================\n\n');
          }
        }
        break;
      default:
        stdout.write('Digite uma opção válida!\n');
    }
    stdout.write('\n\n');

    stdout.write('Digite [ENTER] para voltar ao menu\n\n');
    await stdin.readLineSync();

    clear();

    stdout.writeAll(menuOptions, '\n');
    op = stdin.readLineSync();
  }
  seeYouLater();
}

// Limpa a tela pulando linhas
void clear() {
  for (int i = 0; i < stdout.terminalLines; i++) {
    stdout.writeln();
  }
}

Agenda getContatoFromUserInput() {
  var contato = Agenda();

  stdout.write('Inserir contato:\n\n');

  stdout.write('Nome: ');
  contato.nome = stdin.readLineSync();

  stdout.write('Telefone: ');
  contato.telefone = stdin.readLineSync();

  stdout.write('Email: ');
  contato.email = stdin.readLineSync();

  return contato;
}

class Agenda {
  String nome;
  String telefone;
  String email;

  @override
  String toString() {
    return 'Dados do Contato\n\nNome: $nome\n\nTelefone: $telefone\n\nEmail: $email\n\n';
  }
}

// Limpa a tela e se despede do usuário contando de um até três
void seeYouLater() async {
  clear();
  stdout.write('Saindo!\n');
  await Future.delayed(Duration(milliseconds: 100))
      .then((value) => stdout.write('1...\n'));
  await Future.delayed(Duration(milliseconds: 100))
      .then((value) => stdout.write('2...\n'));
  await Future.delayed(Duration(milliseconds: 100))
      .then((value) => stdout.write('3...\n'));
  await Future.delayed(Duration(milliseconds: 100))
      .then((value) => stdout.write('Pronto!\n'));
}
