import 'package:article_finder/data/article.dart';
import 'package:article_finder/data/article_formatter_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleListItem extends StatelessWidget {
  const ArticleListItem({Key? key, required this.article}) : super(key: key);
  final Article article;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    article.attributes?.name ?? '',
                    style: textTheme.subtitle1,
                  ),
                ),
                if (article.attributes?.cardArtworkUrl != null) ...[
                  const SizedBox(
                    width: 16,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      width: 50.0,
                      height: 50.0,
                      imageUrl: article.attributes!.cardArtworkUrl!,
                    ),
                  ),
                ]
              ],
            ),
            Text(
              article.subscriptionType,
              style: textTheme.bodyText2,
            ),
            const SizedBox(
              height: 16.0,
            ),
            if (article.attributes?.description != null)
              Text(
                article.attributes!.description!,
                style: textTheme.bodyText2,
              ),
            buildDates(context, article.formattedReleaseDate,
                article.formattedDurationInMinutes),
          ],
        ),
      ),
    );
  }

  Widget buildDates(
      BuildContext context, String? releaseDate, String? duration) {
    final String text;
    if (releaseDate == null && duration != null) {
      text = duration;
    } else if (releaseDate != null && duration == null) {
      text = releaseDate;
    } else if (releaseDate != null && duration != null) {
      text = '$releaseDate ($duration)';
    } else {
      return Container();
    }
    final textTheme = Theme.of(context).textTheme;
    return Text(
      text,
      style: textTheme.bodyText2,
    );
  }
}
