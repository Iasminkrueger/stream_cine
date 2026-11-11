
import 'package:flutter_test/flutter_test.dart';
import 'package:stream_cine/filme_utils.dart';
void main() {
  final filmes = [
    {'nome': 'Homem-Aranha'},
    {'nome': 'Interestelar'},
    {'nome': 'Toy Story'},
  ];

  test('Deve retornar todos os filmes quando a busca estiver vazia', () {
    final resultado = filtrarFilmes(filmes, '');

    expect(resultado.length, 3);
  });

  test('Deve encontrar filme mesmo com letras maiúsculas', () {
    final resultado = filtrarFilmes(filmes, 'HOMEM');

    expect(resultado.length, 1);
    expect(resultado.first['nome'], 'Homem-Aranha');
  });

  test('Deve retornar lista vazia quando não encontrar o filme', () {
    final resultado = filtrarFilmes(filmes, 'Avatar');

    expect(resultado, isEmpty);
  });
}
