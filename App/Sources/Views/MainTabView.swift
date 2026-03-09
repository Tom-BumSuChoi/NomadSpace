import SwiftUI
import ComposableArchitecture
import DesignSystem
import FlightFeature
import StayFeature
import WalletFeature
import CommunityFeature
import WorkspaceFeature
import TravelDomainInterface
import PaymentDomainInterface
import NetworkCoreInterface

struct MainTabView: View {
    @Bindable var store: StoreOf<MainTabReducer>
    private let dependencies: AppDependencies

    init(store: StoreOf<MainTabReducer>, dependencies: AppDependencies) {
        self.store = store
        self.dependencies = dependencies
    }

    var body: some View {
        TabView(
            selection: Binding(
                get: { store.selectedTab },
                set: { store.send(.tabSelected($0)) }
            )
        ) {
            NavigationStack {
                MainDashboardView(
                    store: store.scope(state: \.dashboard, action: \.dashboard),
                    flightSearchUseCase: dependencies.flightSearchUseCase,
                    staySearchUseCase: dependencies.staySearchUseCase
                )
                .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Label(
                    MainTabReducer.State.Tab.flights.displayTitle,
                    systemImage: MainTabReducer.State.Tab.flights.icon
                )
            }
            .tag(MainTabReducer.State.Tab.flights)

            StaySearchView(
                viewModel: StaySearchViewModel(
                    staySearchUseCase: dependencies.staySearchUseCase
                )
            )
            .tabItem {
                Label(
                    MainTabReducer.State.Tab.stays.displayTitle,
                    systemImage: MainTabReducer.State.Tab.stays.icon
                )
            }
            .tag(MainTabReducer.State.Tab.stays)

            FeedView(
                viewModel: FeedViewModel(
                    networkClient: dependencies.networkClient
                )
            )
            .tabItem {
                Label(
                    MainTabReducer.State.Tab.community.displayTitle,
                    systemImage: MainTabReducer.State.Tab.community.icon
                )
            }
            .tag(MainTabReducer.State.Tab.community)

            WorkspaceSearchView(
                viewModel: WorkspaceSearchViewModel(
                    networkClient: dependencies.networkClient
                )
            )
            .tabItem {
                Label(
                    MainTabReducer.State.Tab.workspace.displayTitle,
                    systemImage: MainTabReducer.State.Tab.workspace.icon
                )
            }
            .tag(MainTabReducer.State.Tab.workspace)

            WalletView(
                viewModel: WalletViewModel(
                    exchangeRateUseCase: dependencies.exchangeRateUseCase,
                    splitBillUseCase: dependencies.splitBillUseCase
                )
            )
            .tabItem {
                Label(
                    MainTabReducer.State.Tab.wallet.displayTitle,
                    systemImage: MainTabReducer.State.Tab.wallet.icon
                )
            }
            .tag(MainTabReducer.State.Tab.wallet)
        }
        .tint(NomadColors.accent)
    }
}
