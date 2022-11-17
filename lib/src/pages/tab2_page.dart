import 'package:flutter/material.dart';
import 'package:flutter_providernews/src/models/category_model.dart';
import 'package:flutter_providernews/src/services/news_service.dart';
import 'package:flutter_providernews/src/theme/tema.dart';
import 'package:flutter_providernews/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsServices = Provider.of<NewsServices>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const _ListaCategorias(),
            Expanded(
              child: ListaNoticias(
                  noticias: newsServices.getArticlesCategorySelected),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  const _ListaCategorias({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = Provider.of<NewsServices>(context).categories;

    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (BuildContext context, int index) {
          final cName = category[index].name;
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                _CategoryButton(category: category[index]),
                const SizedBox(
                  height: 5,
                ),
                Text('${cName[0].toUpperCase()}${cName.substring(1)}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final newsServices = Provider.of<NewsServices>(context);
    return GestureDetector(
      onTap: () {
        final newsServices = Provider.of<NewsServices>(context, listen: false);
        newsServices.selectectCategory = category.name;
      },
      child: Container(
          width: 40,
          height: 40,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Icon(
            category.icon,
            color: (newsServices.selectectCategory == category.name)
                ? miTema.colorScheme.secondary
                : Colors.black54,
          )),
    );
  }
}
