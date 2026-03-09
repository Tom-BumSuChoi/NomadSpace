import ComposableArchitecture
import FlightFeature
import StayFeature
import TravelDomainInterface

/// 대시보드 리듀서 - 문자열·비즈니스 로직 전부 여기서 관리
/// 뷰는 state/action만 받아 렌더링 (dumb)
@Reducer
struct MainDashboardReducer {
    @ObservableState
    struct State: Equatable {
        var searchQuery: String = "방콕"

        // MARK: - 화면 문자열 (리듀서에서 관리)
        var headerTitle: String { "NomadSpace" }
        var headerSubtitle: String { "디지털 노마드와 글로벌 여행자를 위한 슈퍼앱" }
        var searchPlaceholder: String { "어디로 떠나볼까요?" }
        var searchButtonTitle: String { "검색" }

        var popularDestinationsTitle: String { "인기 여행지" }
        var popularDestinations: [DestinationItem] = [
            .init(title: "방콕 → 치앙마이", subtitle: "12월 15일 · 1명 · 이코노미", price: "₩89,000~"),
            .init(title: "서울 → 도쿄", subtitle: "1월 3일 · 2명 · 이코노미", price: "₩156,000~"),
            .init(title: "발리 우붓 스튜디오", subtitle: "체크인 12/20 · 1박 · 1명", price: "₩45,000~"),
        ]

        var walletLabel: String { "여행 지갑" }
        var walletAmount: String { "₩1,250,000" }
        var walletSubAmount: String { "USD 920 · THB 32,500" }

        var expenseSettlementTitle: String { "경비 정산" }
        var expenseItems: [ExpenseItem] = [
            .init(title: "저녁 식사", subtitle: "식비 · 3명 참여", price: "₩45,000"),
        ]

        var quickActions: [QuickActionItem] = [
            .init(emoji: "✈️", title: "항공"),
            .init(emoji: "🛏️", title: "숙소"),
            .init(emoji: "💳", title: "환율"),
            .init(emoji: "👥", title: "정산"),
        ]
    }

    struct DestinationItem: Equatable {
        let title: String
        let subtitle: String
        let price: String
    }

    struct ExpenseItem: Equatable {
        let title: String
        let subtitle: String
        let price: String
    }

    struct QuickActionItem: Equatable {
        let emoji: String
        let title: String
    }

    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case searchTapped
        case quickActionTapped(QuickActionItem)
    }

    var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding(\.searchQuery):
                return .none
            case .searchTapped:
                return .none
            case .quickActionTapped:
                return .none
            case .binding:
                return .none
            }
        }
    }
}
