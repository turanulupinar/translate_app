enum DummyTextEnum { offlineText, welcomeText }

extension DummyStringExtension on DummyTextEnum {
  String get text {
    switch (this) {
      case DummyTextEnum.offlineText:
        return "Şuan offline durumda olduğun için bazı içerikler görüntülenmeyebilir.";
      case DummyTextEnum.welcomeText:
        return "Hoş geldiniz uygulamayı kullanmaya başlayabilirsiniz.";
      default:
        return "Bilinmeyen bir durum var.";
    }
  }
}
