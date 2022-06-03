class Article {
  late final String id;
  late final String? type;
  late final Attributes? attributes;
  late final Links? links;
  Article.fromJson(dynamic json)
      : id = json['id'],
        type = json['type'],
        attributes = Attributes.fromJson(json['attributes']),
        links = Links.fromJson(json['links']);
}

class Attributes {
  late final String? uri;
  late final String? name;
  late final String? description;
  late final String? releasedAt;
  late final bool? free;
  late final String? difficulty;
  late final String? contentType;
  late final int? duration;
  late final double? popularity;
  late final String? technologyTripleString;
  late final String? contributorString;
  late final String? ordinal;
  late final bool? professional;
  late final String? descriptionPlainText;
  late final int? videoIdentifier;
  late final int? parentName;
  late final bool? accessible;
  late final String? cardArtworkUrl;

  Attributes.fromJson(Map json)
      : uri = json['uri'],
        name = json['name'],
        description = json['description'],
        releasedAt = json['released_at'],
        free = json['free'],
        difficulty = json['difficulty'],
        contentType = json['content_type'],
        duration = json['duration'],
        popularity = json['popularity'],
        technologyTripleString = json['technology_triple_string'],
        contributorString = json['contributor_string'],
        ordinal = json['ordinal'],
        professional = json['professional'],
        descriptionPlainText = json['description_plain_text'],
        videoIdentifier = json['video_identifier'],
        parentName = json['parent_name'],
        accessible = json['accessible'],
        cardArtworkUrl = json['card_artwork_url'];
}

class Links {
  late final String? self;
  Links.fromJson(Map json) : self = json['self'];
}
