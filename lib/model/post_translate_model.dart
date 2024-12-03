class PostTranslateModel {
  String? from;
  String? to;
  List<String>? protectedPaths;
  List<String>? commonProtectedPaths;
  JsonTranslate? jsonTranslate;

  PostTranslateModel({
    this.from,
    this.to,
    this.protectedPaths,
    this.commonProtectedPaths,
    this.jsonTranslate,
  });

  // PostTranslateModel.fromJson(Map<String, dynamic> json) {
  //   from = json['from'];
  //   to = json['to'];
  //   protectedPaths = json['protected_paths']?.cast<String>() ?? [];
  //   commonProtectedPaths = json['common_protected_paths']?.cast<String>() ?? [];
  //   jsonTranslate =
  //       json['json'] != null ? JsonTranslate.fromJson(json['json']) : null;
  // }

  // TODO : trans keyi burada yok buraya dikakt üstteki ilk hamle alttaki sonra ki nice

  PostTranslateModel.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    protectedPaths = json['protected_paths']?.cast<String>() ?? [];
    commonProtectedPaths = json['common_protected_paths']?.cast<String>() ?? [];

    // 'trans' anahtarını dikkate alarak jsonTranslate'ı oluştur
    final trans = json['trans'];
    if (trans != null) {
      jsonTranslate = JsonTranslate.fromJson(trans);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from,
      'to': to,
      'protected_paths': protectedPaths,
      'common_protected_paths': commonProtectedPaths,
      'json': jsonTranslate?.toJson(),
    };
  }
}

class JsonTranslate {
  String? title;
  String? author;
  double? rate;
  Extra? extra;

  JsonTranslate({this.title, this.author, this.rate, this.extra});

  JsonTranslate.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    author = json['author'];
    rate = json['rate'];
    extra = json['extra'] != null ? Extra.fromJson(json['extra']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'rate': rate,
      'extra': extra?.toJson(),
    };
  }
}

class Extra {
  String? image;
  int? commentCounts;
  LastComment? lastComment;

  Extra({this.image, this.commentCounts, this.lastComment});

  Extra.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    commentCounts = json['comment_counts'];
    lastComment = json['last_comment'] != null
        ? LastComment.fromJson(json['last_comment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'comment_counts': commentCounts,
      'last_comment': lastComment?.toJson(),
    };
  }
}

class LastComment {
  String? author;
  String? shortText;

  LastComment({this.author, this.shortText});

  LastComment.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    shortText = json['short_text'];
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'short_text': shortText,
    };
  }
}
