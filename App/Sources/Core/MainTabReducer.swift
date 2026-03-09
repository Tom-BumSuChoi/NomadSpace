import ComposableArchitecture
import FlightFeature
import StayFeature
import WalletFeature
import CommunityFeature
import WorkspaceFeature
import TravelDomainInterface
import PaymentDomainInterface
import NetworkCoreInterface

/// 탭 문자열·아이콘 리듀서에서 관리
@Reducer
struct MainTabReducer {
    @ObservableState
    struct State: Equatable {
        var selectedTab: Tab = .flights
        var dashboard: MainDashboardReducer.State = .init()

        enum Tab: String, CaseIterable, Equatable {
            case flights
            case stays
            case community
            case workspace
            case wallet

            var displayTitle: String {
                switch self {
                case .flights: return "항공"
                case .stays: return "숙소"
                case .community: return "커뮤니티"
                case .workspace: return "코워킹"
                case .wallet: return "지갑"
                }
            }

            var icon: String {
                switch self {
                case .flights: return "airplane"
                case .stays: return "bed.double"
                case .community: return "person.3"
                case .workspace: return "desktopcomputer"
                case .wallet: return "creditcard"
                }
            }
        }
    }

    enum Action {
        case tabSelected(MainTabReducer.State.Tab)
        case dashboard(MainDashboardReducer.Action)
    }

    var body: some ReducerOf<Self> {
        Scope(state: \.dashboard, action: \.dashboard) {
            MainDashboardReducer()
        }
        Reduce { state, action in
            switch action {
            case let .tabSelected(tab):
                state.selectedTab = tab
                return .none
            case .dashboard:
                return .none
            }
        }
    }
}
