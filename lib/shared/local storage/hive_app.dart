import 'package:hive/hive.dart';
part 'hive_app.g.dart';

@HiveType(typeId: 0)
class AppSettings {
  AppSettings({required this.isDark, required this.uid});

  @HiveField(0)
  bool isDark;

  @HiveField(1)
  String uid;

  bool getIsDark() {
    return isDark;
  }

  String getUid() {
    return uid;
  }
}
