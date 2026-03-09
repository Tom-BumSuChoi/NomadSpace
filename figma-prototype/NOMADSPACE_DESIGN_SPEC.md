# NomadSpace Figma 디자인 스펙

디자이너 없이 Figma에 디자인 초안을 만들 때 참고할 수 있는 스펙입니다.

## 색상 (Design Tokens)

| 토큰 | HEX | 용도 |
|------|-----|------|
| `accent` | #2196F3 | 주요 액션, 버튼, 탭 선택 |
| `highlight` | #FF9500 | 강조, 알림 |
| `surface` | #F2F3F5 | 배경 |
| `onSurface` | #212121 | 메인 텍스트 |
| `onSurfaceSecondary` | #878787 | 보조 텍스트 |
| `success` | #34C759 | 성공, 정산 잔액 |
| `error` | #F04438 | 에러, 마이너스 잔액 |
| `cardBackground` | #FFFFFF | 카드, 입력 필드 |

## 탭 구조 (5개)

1. **항공** (airplane) - FlightSearchView
2. **숙소** (bed.double) - StaySearchView
3. **커뮤니티** (person.3) - FeedView
4. **코워킹** (desktopcomputer) - WorkspaceSearchView
5. **지갑** (creditcard) - WalletView

## 주요 컴포넌트

- **NomadCard**: 둥근 모서리(12px), 흰색 배경, 그림자
- **NomadButton**: accent 색상, secondary 스타일
- **NomadTextField**: 아이콘 + 입력 필드
- **검색 바**: 검색어 + 검색 버튼

## Figma에 넣는 방법

1. **프로토타입 실행**: `cd figma-prototype && python3 -m http.server 8765`
2. **브라우저에서 열기**: http://localhost:8765
3. **캡처**: 
   - Figma에서 **File → Place image** (Ctrl/Cmd + Shift + K)로 스크린샷 붙여넣기
   - 또는 Figma AI **Generate**로 "NomadSpace 앱 메인 화면" 프롬프트 시도
