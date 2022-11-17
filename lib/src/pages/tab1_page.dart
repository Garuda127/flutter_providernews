import 'package:flutter/material.dart';
import 'package:flutter_providernews/src/services/news_service.dart';
import 'package:provider/provider.dart';

import '../widgets/lista_noticias.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final newsServices = Provider.of<NewsServices>(context);

    return Scaffold(
      body: (newsServices.headlines.isEmpty)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListaNoticias(noticias: newsServices.headlines),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
