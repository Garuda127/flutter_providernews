import 'package:flutter/material.dart';
import 'package:flutter_providernews/src/models/news_models.dart';
import 'package:flutter_providernews/src/theme/tema.dart';

class ListaNoticias extends StatelessWidget {
  const ListaNoticias({super.key, required this.noticias});
  final List<Article> noticias;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index) {
        return _Noticia(noticia: noticias[index], index: index);
      },
    );
  }
}

class _Noticia extends StatelessWidget {
  const _Noticia({required this.noticia, required this.index});
  final Article noticia;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar(noticia, index),
        _TarjetaTitulo(noticia),
        _TarjetaImagen(noticia: noticia),
        _TarjetaBody(noticia),
        const _TarjetaBotones(),
        const SizedBox(height: 10),
        const Divider()
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  const _TarjetaBotones();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RawMaterialButton(
            onPressed: () {},
            fillColor: miTema.colorScheme.secondary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.star_border),
          ),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.more),
          )
        ],
      ),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  const _TarjetaImagen({required this.noticia});
  final Article noticia;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: Container(
          child: (noticia.urlToImage != null)
              ? FadeInImage(
                  placeholder: const AssetImage('assets/giphy.gif'),
                  image: NetworkImage(noticia.urlToImage!),
                )
              : const Image(
                  image: AssetImage('assets/no-image.png'),
                ),
        ),
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  const _TarjetaBody(this.noticia);
  final Article noticia;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text((noticia.description != null) ? noticia.description! : ''),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  const _TarjetaTopBar(this.noticia, this.index);

  final Article noticia;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}. ',
            style: TextStyle(color: miTema.colorScheme.secondary),
          ),
          Text(
            '${noticia.source.name}. ',
          )
        ],
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  const _TarjetaTitulo(this.noticia);
  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        noticia.title,
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
    );
  }
}
