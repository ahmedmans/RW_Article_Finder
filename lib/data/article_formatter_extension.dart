import 'package:article_finder/data/article.dart';
import 'package:intl/intl.dart';

final _releaseDateFormat = DateFormat('MMM d yyy');

extension ArticleFormatterExtension on Article {
  String get subscriptionType {
    if (attributes?.free == true) {
      return 'free';
    }
    if (attributes?.professional == true) {
      return 'professional';
    }
    return 'beginner';
  }

  String? get formattedReleaseDate {
    final releasedAtString = attributes?.releasedAt;
    if (releasedAtString == null) return null;

    final releasedAt = DateTime.tryParse(releasedAtString);
    if (releasedAt == null) return null;
    return _releaseDateFormat.format(releasedAt);
  }

  String? get formattedDurationInMinutes {
    final duration = attributes?.duration;
    if (duration == null) return null;
    final durationInMinutes = duration / 60;
    return '${durationInMinutes.toStringAsFixed(0)} mins';
  }
}
