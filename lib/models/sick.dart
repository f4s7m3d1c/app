//TODO: enum으로 증상 정리

import 'package:fastmedic/utils/assets.dart';

enum Sick {
  cough, // 기침
  stomachache, // 복통
  burns, // 화상 나중에 두드러기
  dyspnoea, // 호흡곤란
  headache, // 두통
  nausea, // 메스꺼움
  convulsion, // 경련
  blister, // 물집, 수포
  congestion, // 충혈
  fever, // 발열
}

extension ParseToString on Sick {
  String toKeyword() {
    switch (this) {
      case Sick.cough:
        return "기침";
      case Sick.stomachache:
        return "복통";
      case Sick.burns:
        return "화상";
      case Sick.dyspnoea:
        return "호흡곤란";
      case Sick.headache:
        return "두통";
      case Sick.nausea:
        return "메스꺼움";
      case Sick.convulsion:
        return "경련";
      case Sick.blister:
        return "수포";
      case Sick.congestion:
        return "충혈";
      case Sick.fever:
        return "발열";
    }
  }

  String toImagePath() {
    switch (this) {
      case Sick.cough:
        return "${Assets.sick_images}cough.jpg";
      case Sick.stomachache:
        return "${Assets.sick_images}colic.jpg";
      case Sick.burns:
        return "${Assets.sick_images}burns.jpg";
      case Sick.dyspnoea:
        return "${Assets.sick_images}breath.jpg";
      case Sick.headache:
        return "${Assets.sick_images}headache.jpg";
      case Sick.nausea:
        return "${Assets.sick_images}sickness.jpg";
      case Sick.convulsion:
        return "${Assets.sick_images}convulsion.jpg";
      case Sick.blister:
        return "${Assets.sick_images}blister.jpg";
      case Sick.congestion:
        return "${Assets.sick_images}congestion.jpg";
      case Sick.fever:
        return "${Assets.sick_images}fever.jpg";
    }
  }

  String toKorean() {
    switch (this) {
      case Sick.blister:
        return "물집, 수포";
      default:
        return toKeyword();
    }
  }
}
