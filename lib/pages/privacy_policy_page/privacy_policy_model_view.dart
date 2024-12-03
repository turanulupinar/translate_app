final dummyPrivacyPolicy = {
  "title": "Gizlilik Politikası",
  "body":
      "  TranslateApp olarak, kullanıcılarımızın gizliliğini ciddiye alıyoruz. Bu Gizlilik Politikası, uygulamamız üzerinden toplanan bilgilerin nasıl işlendiğini, saklandığını ve korunduğunu açıklamaktadır. Toplanan Bilgiler , Uygulamamız, kullanıcı deneyimini geliştirmek amacıyla sınırlı kişisel ve teknik bilgi toplayabilir  Metin Verileri: Çeviri amacıyla kullanıcılar tarafından gönderilen içerikler. Cihaz Bilgileri: IP adresi, cihaz türü, işletim sistemi gibi anonim bilgiler. Kullanıcı İstatistikleri: Uygulamanın hangi özelliklerinin ne sıklıkla kullanıldığına dair veriler.Kullanıcı İstatistikleri: Uygulamanın hangi özelliklerinin ne sıklıkla kullanıldığına dair veriler.Bilgi Kullanımı  -Toplanan bilgiler şu amaçlarla kullanılabilir:Çeviri işlemlerinin gerçekleştirilmesi. - Uygulama performansının analiz edilmesi ve iyileştirilmesi.-Hata raporlarının incelenmesi. 3 Üçüncü Taraf Paylaşımı - Toplanan bilgiler, yalnızca aşağıdaki durumlarda üçüncü taraflarla paylaşılabilir:",
  "route": "/homepage"
};

class DummyPrivacyPolicy {
  String? title;
  String? body;
  String? route;

  DummyPrivacyPolicy({this.title, this.body, this.route});

  DummyPrivacyPolicy.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    route = json['route'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    data['route'] = route;
    return data;
  }
}
