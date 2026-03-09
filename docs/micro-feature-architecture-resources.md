# 마이크로 피쳐 아키텍처 (µFeatures / TMA) — 전체 자료 모음

---

## 1. 공식 문서 및 원본 자료

| 제목 | 저자 | 링크 |
|---|---|---|
| **The Modular Architecture (TMA)** — Tuist 공식 가이드 | Tuist | https://docs.tuist.io/en/guides/features/projects/tma-architecture |
| **TMA 한국어 문서** | Tuist | https://docs.tuist.io/ko/guides/features/projects/tma-architecture |
| **Building µFeatures** (원조 발표, 2017) | Pedro Piñera | https://speakerdeck.com/pepibumur/building-ufeatures-1 |
| **µFeatures Example Repository** | Tuist | https://github.com/tuist/microfeatures-example |
| **µFeatures Architecture Tuist Plugin** | jihoonahn | https://github.com/jihoonahn/microfeature |

---

## 2. Pedro Piñera (Tuist 창시자) 블로그

| 제목 | 내용 | 링크 |
|---|---|---|
| **Evolving Tuist's Architecture** | Tuist 내부 아키텍처 진화 과정 | https://pepicrft.me/evolving-tuists-architecture/ |
| **Modularization in Open Source Projects** | µFeatures를 오픈소스에 적용한 경험, Core/Feature 분리 | https://pepicrft.me/blog/modularization-in-open-source/ |
| **Tuist and the Swift Package Manager** | SPM과 Tuist의 관계 | https://pepicrft.me/blog/tuist-and-spm/ |
| **Tuist Is Not What You Think It Is** | Tuist의 철학과 방향성 | https://pepicrft.me/blog/tuist-is-not-what-you-think-it-is/ |

---

## 3. 핵심 기술 블로그 (영문)

| 제목 | 저자 | 핵심 내용 | 링크 |
|---|---|---|---|
| **Reducing iOS Build Times by using Interface Modules** | SwiftRock (Bruno Rocha) | TMA의 Interface 타겟 아이디어의 원전. 인터페이스 분리로 빌드 시간 대폭 단축 | https://swiftrocks.com/reducing-ios-build-times-by-using-interface-targets |
| **Scalable Modularization with Tuist** | Narlei (Narlei Moreira) | Tuist + TMA 실전 적용 튜토리얼, 의존성 그래프 설계 | https://narlei.com/development/scalable-modularization-with-tuist |
| **Modular Feature Architecture in SwiftUI** | Sebastian Lato | SwiftUI 전용 모듈화 패턴, 라우팅/DI/프리뷰 | https://dev.to/sebastienlato/modular-feature-architecture-in-swiftui-55bi |
| **Static, Dynamic, and Mergeable Linking in Modular iOS Apps** | Livsy Code | Static/Dynamic/Mergeable 프레임워크 선택 가이드 | https://livsycode.com/best-practices/static-dynamic-and-mergeable-linking-in-modular-ios-apps/ |

---

## 4. "iOS App As a Microservice" 시리즈 — Alex Dremov

마이크로서비스 개념을 iOS에 적용한 3부작 시리즈:

| 순서 | 제목 | 내용 | 링크 |
|---|---|---|---|
| Part 1 | **Build Robust App Architecture** | 마이크로피쳐 핵심 개념, Features/Apps 분리 | https://alexdremov.me/ios-app-as-a-microservice-build-robust-app-architecture/ |
| Part 2 | **Modularize Your App With Tuist** | Tuist를 사용한 실제 구현 | https://alexdremov.me/ios-app-as-a-microservice-modularize-your-app-with-tuist/ |
| Part 3 | **Using SwiftUI in Modular App** | SwiftUI 모듈화 시 상태관리/책임 경계 | https://alexdremov.me/ios-app-as-a-microservice-using-swiftui-in-modular-app/ |
| 코드 | **TuistExample** (GitHub) | 실습 리포지토리 | https://github.com/alexdremov/TuistExample |

---

## 5. "Microapps Architecture in Swift" 시리즈 — Swift with Majid

SPM 기반 마이크로앱 아키텍처 시리즈:

| 순서 | 제목 | 핵심 | 링크 |
|---|---|---|---|
| Part 1 | **SPM Basics** | SPM으로 모듈 분리 기초 | https://swiftwithmajid.com/2022/01/12/microapps-architecture-in-swift-spm-basics/ |
| Part 2 | **Feature Modules** | Foundation/Feature 모듈 설계 | https://swiftwithmajid.com/2022/01/19/microapps-architecture-in-swift-feature-modules/ |
| Part 3 | **Dependency Injection** | Dependencies 구조체 패턴, 테스트 용이성 | https://swiftwithmajid.com/2022/02/02/microapps-architecture-in-swift-dependency-injection/ |
| Part 4 | **Scaling** (2025) | 100+ 모듈 규모 확장 전략, package-per-feature | https://swiftwithmajid.com/2025/05/27/microapps-architecture-in-swift-scaling/ |

---

## 6. "iOS Microapps Architecture" 시리즈 — Artem Kvasnetskyi (Medium)

| 순서 | 제목 | 핵심 | 링크 |
|---|---|---|---|
| Part 1 | **iOS Microapps Architecture — Part 1** | 모놀리식 문제점, 모듈화 해법 | https://medium.com/@artemkvasnetcky/ios-microapp-architecture-part-1-50cd2bcaccd6 |
| Part 2 | **iOS Microapps Architecture — Part 2** | Utility/Foundation/UI 레이어 분리 | https://medium.com/@artemkvasnetcky/ios-microapps-architecture-part-2-1cc2ceefaaec |
| 코드 | **MicroappArchitectureDemo** (GitHub) | SPM 기반 데모 프로젝트 | https://github.com/kvasnetskyi/MicroappArchitectureDemo |

---

## 7. 한국어 자료

| 제목 | 조직/저자 | 핵심 내용 | 링크 |
|---|---|---|---|
| **1년동안의 iOS 모듈화 진행기** | 카카오스타일 (지그재그) | 실전 모듈화 경험, 네이밍 규칙 실수, 점진적 분리 교훈 | https://devblog.kakaostyle.com/ko/2025-02-10-1-ios-modularization-journey/ |
| **다나와 PC견적 Tuist 도입기** | 다나와 | ObjC→Swift 전환 + Tuist 도입, xcodeproj 충돌 해결 | https://danawalab.github.io/ios/2024/12/16/iOS-Tuist.html |
| **Pumping-iOS** (Best Practice) | 디프만 (Depromeet) | Tuist 마이크로피쳐 실전 적용 오픈소스 프로젝트 | https://github.com/depromeet/pumping-ios |
| **µFeatures 아키텍쳐 Tuist 플러그인** | jihoonahn | Tuist 플러그인으로 µFeatures 자동 생성 | https://github.com/jihoonahn/microfeature |
| **ragnarock91/ufeatures-example** | ragnarock91 | µFeatures 아키텍처 iOS 예제 프로젝트 | https://github.com/ragnarock91/ufeatures-example |

---

## 8. 기업 사례 (Production Case Studies)

| 기업 | 규모 | 성과 | 링크 |
|---|---|---|---|
| **Back Market** (Part 1) | 150+ Swift packages | SwiftPM→Tuist 마이그레이션 이유 | https://engineering.backmarket.com/back-market-x-tuist-part-i-why-we-moved-our-ios-project-to-tuist-f161cf914700 |
| **Back Market** (Part 2) | 150+ Swift packages | 실제 마이그레이션 과정 | https://engineering.backmarket.com/back-market-x-tuist-ii-how-we-migrated-our-ios-project-from-swiftpm-to-tuist-cef9ecc88c8c |
| **monday.com** | 200 모듈, 20명 | CI 시간 20분→9분 단축 | https://cloud.tuist.io/blog?category=case-studies |
| **Trendyol** | 170+ 개발자 | 빌드 시간 65% 감소, UI 테스트 셋업 30초 | https://cloud.tuist.io/blog?category=case-studies |
| **Bumble** | 대규모 | Bazel/SPM 대비 Tuist 선택 | https://tuist.dev/blog/2024/07/16/empower-teams-to-build-better-apps-faster |

---

## 9. Tuist 최신 동향 (2025-2026)

| 제목 | 핵심 | 링크 |
|---|---|---|
| **Metadata Tags로 타겟 정리** | layer/team/feature 다차원 태그 관리 | https://tuist.dev/blog/2025/10/31/metadata-tags |
| **Why Generate Xcode Projects in 2025** | 캐싱/모듈화 관리의 가치 | https://tuist.dev/blog/2025/02/25/project-generation |
| **Why Large Swift Projects Hit a Wall** | 대규모 프로젝트 확장 전략 | https://tuist.dev/blog/2025/09/22/scale |
| **Tuist Linux 지원** (2026) | CLI Linux 빌드 제공 시작 | https://tuist.dev/blog/2026/02/16/linux |
