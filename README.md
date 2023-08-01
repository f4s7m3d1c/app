# fastmedic

학교 공모전

## Getting Started
1. flutter pub get으로 의존성 모듈 다운
```shell
$ flutter pub get
```
2. .env 파일 루트에 생성
```.env
NAVER_MAP_KEY=YOUR_KEY
```
3. 환경 변수 관련 빌드
```shell
$ flutter pub add --dev envied_generator
$ flutter pub add --dev build_runner
```