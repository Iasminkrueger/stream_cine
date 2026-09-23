import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(const StreamCineApp());
}

class StreamCineApp extends StatelessWidget {
  const StreamCineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stream Cine',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
      ),
      home: const TelaInicial(),
    );
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() {
    return _TelaInicialState();
  }
}

class _TelaInicialState extends State<TelaInicial> {
  final List<Map<String, dynamic>> filmes = [
    {
      'nome': 'Homem-Aranha',
      'genero': 'Ação',
      'nota': '8.2',
      'favorito': false,
      'imagem':
          'https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
    },
    {
      'nome': 'Interestelar',
      'genero': 'Ficção científica',
      'nota': '8.7',
      'favorito': false,
      'imagem':
          'https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
    },
    {
      'nome': 'Vingadores: Ultimato',
      'genero': 'Ação',
      'nota': '8.3',
      'favorito': false,
      'imagem':
          'https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
    },
    {
      'nome': 'Toy Story',
      'genero': 'Animação',
      'nota': '8.3',
      'favorito': false,
      'imagem':
          'https://image.tmdb.org/t/p/w500/uXDfjJbdP4ijW5hWSBrPrlKpxab.jpg',
    },
    {
      'nome': 'Batman',
      'genero': 'Ação',
      'nota': '8.5',
      'favorito': false,
      'imagem':
          'https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg',
    },
    {
      'nome': 'Divertida Mente',
      'genero': 'Animação',
      'nota': '8.1',
      'favorito': false,
      'imagem':
          'https://image.tmdb.org/t/p/w500/62SAZfLyBvTbqM3Wg4g7J5c7yZK.jpg',
    },
  ];

  final TextEditingController _buscaController = TextEditingController();
  String _termoBusca = '';

  List<Map<String, dynamic>> get filmesFiltrados {
    if (_termoBusca.isEmpty) {
      return filmes;
    }
    return filmes.where((filme) {
      return filme['nome']
          .toString()
          .toLowerCase()
          .contains(_termoBusca.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stream Cine',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filmes em destaque',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _buscaController,
              decoration: const InputDecoration(
                hintText: 'Buscar filme pelo nome...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (valor) {
                setState(() {
                  _termoBusca = valor;
                });
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: filmesFiltrados.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.58,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(8),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: filmesFiltrados[index]['imagem'],
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                  errorWidget: (context, url, error) {
                                    return const Center(
                                      child: Icon(
                                        Icons.error,
                                        size: 40,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 5,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      filmesFiltrados[index]['favorito'] =
                                          !filmesFiltrados[index]['favorito'];
                                    });

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          filmesFiltrados[index]['favorito']
                                              ? 'Filme adicionado aos favoritos!'
                                              : 'Filme removido dos favoritos!',
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    filmesFiltrados[index]['favorito']
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                filmesFiltrados[index]['nome'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                filmesFiltrados[index]['genero'],
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    filmesFiltrados[index]['nota'],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}