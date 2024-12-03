import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:translate_app/util/color_validator.dart';

class LoadingWidget {
  final spinkit = SpinKitSpinningLines(
    color: ColorValidator().colValidator("orange"),
    size: 40,
  );
}
