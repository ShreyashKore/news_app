import 'package:flutter/material.dart';
import 'package:news_app/ui/article_details_screen.dart';
import 'package:news_app/ui/provider/articles_provider.dart';
import 'package:provider/provider.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  Widget build(BuildContext context) {
    final articlesProvider = context.watch<ArticlesProvider>();
    final articles = articlesProvider.articles;
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Headlines"),
      ),
      body: Center(
        child: articlesProvider.inProgress
            ? CircularProgressIndicator()
            : articles.isEmpty
                ? Column(
                    children: [
                      Text("Kindly Reload"),
                      TextButton(
                          onPressed: articlesProvider.getHeadlines,
                          child: Text("Retry"))
                    ],
                  )
                : ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (ctx, i) {
                      final article = articles[i];
                      return Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          contentPadding: EdgeInsets.all(8),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) =>
                                    ArticleDetailsScreen(article: article)),
                          ),
                          leading: Container(
                            width: 100,
                            child: Image.network(
                              article.urlToImage ?? "",
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(article.title),
                          subtitle: Text(article.publishedAt ?? ""),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
