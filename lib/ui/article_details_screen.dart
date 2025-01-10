import 'package:flutter/material.dart';
import 'package:news_app/data/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsScreen extends StatefulWidget {
  final Article article;

  const ArticleDetailsScreen({super.key, required this.article});

  @override
  State<ArticleDetailsScreen> createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  Article get article => widget.article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              article.urlToImage ?? "",
              height: 400,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    article.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => launchUrl(Uri.parse(article.url!)),
                            child: Text(
                              article.url!,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withOpacity(.5)),
                            ),
                          ),
                        ),
                        Icon(Icons.link,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(.5))
                      ],
                    ),
                  ),
                  Text(
                    article.description ?? "NO DATA",
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
