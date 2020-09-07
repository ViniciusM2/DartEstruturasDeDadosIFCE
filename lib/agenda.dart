import 'dart:io';

import 'contato.dart';

class Agenda {
  Agenda() : contatos = [];
  List<Contato> contatos;

  void inserir(Contato contato) {
    contatos.add(contato);
  }

  void consultar(Contato contato) {
    contatos.contains(contato);
  }

  void excluir(Contato contato) {
    contatos.remove(contato);
  }

  void listar() {
    stdout.writeAll(contatos, '====================================\n\n');
  }
}
