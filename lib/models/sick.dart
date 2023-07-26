//TODO: enum으로 증상 정리

enum Sick{
  cough, // 기침
  stomachache, // 복통
  hives, // 두드러기
  dyspnea, // 호흡곤란
  headache, // 두통
  nausea, // 메스꺼움
  convulsion, // 경련
  bulla, // 물집, 수포
  hyperemia, // 충혈
  fever, // 발열
}

extension ParseToString on Sick{
  String toKeyword() {
    switch(this) {
      case Sick.cough:
        return "기침";
      case Sick.stomachache:
        return "두통";
      case Sick.hives:
        return "두드러기";
      case Sick.dyspnea:
        return "호흡곤란";
      case Sick.headache:
        return "두통";
      case Sick.nausea:
        return "메스꺼움";
      case Sick.convulsion:
        return "경련";
      case Sick.bulla:
        return "수포";
      case Sick.hyperemia:
        return "충혈";
      case Sick.fever:
        return "발열";
    }
  }

  String toKorean() {
    switch(this) {
      case Sick.bulla:
        return "물집, 수포";
      default:
        return toKeyword();
    }
  }
}