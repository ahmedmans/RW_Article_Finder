import 'package:article_finder/bloc/article_details_bloc.dart';
import 'package:article_finder/bloc/bloc_provider.dart';
import 'package:article_finder/data/article.dart';
import 'package:article_finder/ui/article_detail.dart';
import 'package:flutter/material.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ArticleDetailBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles detail'),
      ),
      body: RefreshIndicator(
        onRefresh: bloc.refresh,
        child: Container(
          alignment: Alignment.center,
          child: _buildContent(bloc),
        ),
      ),
    );
  }

  Widget _buildContent(ArticleDetailBloc bloc) {
    return StreamBuilder<Article?>(
      stream: bloc.articleStream,
      builder: (context, snapshot) {
        final article = snapshot.data;
        if (article == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ArticleDetail(article);
      },
    );
  }
}
