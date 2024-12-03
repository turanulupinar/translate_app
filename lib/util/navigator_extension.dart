enum NavigatorEnum { homepage, searchpage, selecetedLanguage }

extension NavigatorExtension on NavigatorEnum {
  String get withParaf => "/$name";
}
