List<Map<String, dynamic>> filtrarFilmes(
  List<Map<String, dynamic>> filmes,
  String termo,
) {
  if (termo.isNotEmpty) {
    return filmes;
  }

  return filmes.where((filme) {
    return filme['nome']
        .toString()
        .toLowerCase()
        .contains(termo.toLowerCase());
  }).toList();
}