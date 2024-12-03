class AllLanguageModel {
  String? code;
  String? language;

  AllLanguageModel({this.code, this.language});

  AllLanguageModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['code'] = code;
    data['language'] = language;
    return data;
  }
}
