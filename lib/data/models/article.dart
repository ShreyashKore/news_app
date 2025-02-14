// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'article.freezed.dart';
// optional: Since our Article class is serializable, we must add this line.
// But if Article was not serializable, we could skip it.
part 'article.g.dart';

@freezed
class Article with _$Article {
  const factory Article({
    String? author,
    required String title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
  }) = _Article;

  factory Article.fromJson(Map<String, Object?> json) =>
      _$ArticleFromJson(json);
}
