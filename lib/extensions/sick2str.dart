import '../models/Sick.dart';

extension SickList2str on List<Sick> {

  String parse() {
    String str = "";
    int count = length;
    for(int i = 0; i < count; i++){
      str += this[i].toKorean();
      if(i == count - 1) {
        str += ", ";
      }
    }
    return str;
  }
}