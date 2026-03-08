# AGENTS.md

## 프로젝트 개요

Tuist로 관리되는 SwiftUI iOS 앱 프로젝트 (HelloTuist). 외부 의존성으로 Alamofire 5.10.2를 사용한다.

## Cursor Cloud specific instructions

### 플랫폼 제약

이 프로젝트는 **iOS 전용 앱**으로, 완전한 빌드/실행/테스트에는 **macOS + Xcode**가 필요하다. Linux Cloud VM에서는 다음 제한이 있다:

- `tuist install`, `tuist generate` (프로젝트 생성), `tuist build`, `tuist test`: macOS 전용 명령. Linux Tuist 바이너리는 서버/프로젝트 관리 명령만 제공.
- SwiftUI, UIKit: Linux에서 컴파일 불가.
- XCTest 기반 단위 테스트: iOS 시뮬레이터 필요.

### Linux에서 가능한 작업

- **Swift 구문 검증**: `swiftc -parse <파일>` 로 구문 오류 확인 가능.
- **의존성 해결**: `cd Tuist && swift package resolve` 로 Alamofire 등 SPM 의존성 다운로드.
- **의존성 빌드**: `cd Tuist && swift build --target Alamofire` 로 Alamofire 라이브러리 컴파일 확인.
- **Tuist 서버 명령**: `tuist auth`, `tuist project`, `tuist organization` 등 서버 관련 명령 사용 가능.

### 사전 설치된 도구

- **Swift 6.0.3**: `/opt/swift-6.0.3-RELEASE-ubuntu24.04/usr/bin/` (PATH에 추가됨)
- **mise**: `~/.local/bin/mise` (Tuist 버전 관리)
- **Tuist 4.155.3**: mise로 설치됨, `eval "$(mise activate bash)"` 후 사용 가능

### 프로젝트 구조

- `Project.swift`, `Tuist.swift`: Tuist 프로젝트 정의 (ProjectDescription DSL)
- `Tuist/Package.swift`: SPM 의존성 정의 (Alamofire)
- `HelloTuist/Sources/`: 앱 소스 코드 (SwiftUI)
- `HelloTuist/Tests/`: 단위 테스트 (XCTest)
- `HelloTuist/Resources/`: 에셋 카탈로그
