import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: "NAVER_MAP_KEY", obfuscate: true)
  static final String naver_map_key = _Env.naver_map_key;
}