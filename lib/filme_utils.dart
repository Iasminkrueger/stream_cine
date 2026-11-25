List<Map<String, dynamic>> filtrarFilmes(
  List<Map<String, dynamic>> filmes,
  String termo,
) {
  final termoNormalizado = termo.trim().toLowerCase();

  if (termoNormalizado.isEmpty) {
    return filmes;
  }

  return filmes.where((filme) {
    return filme['nome']
        .toString()
        .toLowerCase()
        .contains(termoNormalizado);
  }).toList();
}