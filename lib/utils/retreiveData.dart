import '../db/articles_database.dart';
import '../models/article.dart';

late List<Articles> article;
late Articles articleData;

Future getDataFromDb(String sentence) async {
  articleData =
      await ArticlesDatabase.instance.readNoteThroughTitle(sentence.trim());

  return articleData;
}
