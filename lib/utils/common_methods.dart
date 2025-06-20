import 'package:get/get.dart';

Future<T?>? navigationToNamed<T>(
  String page, {
  dynamic arguments,
  Map<String, String>? parameters,
}) async {
  var res = await Get.toNamed(
    page,
    parameters: parameters,
    arguments: arguments,
  );
  return res;
}
