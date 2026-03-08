import SwiftUI
import DesignSystem

struct MainTabView: View {
    @State private var selectedTab: Tab = .flights

    enum Tab: String, CaseIterable {
        case flights = "항공"
        case stays = "숙소"
        case community = "커뮤니티"
        case workspace = "코워킹"
        case wallet = "지갑"

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

    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(Tab.allCases, id: \.self) { tab in
                tabContent(for: tab)
                    .tabItem {
                        Label(tab.rawValue, systemImage: tab.icon)
                    }
                    .tag(tab)
            }
        }
        .tint(NomadColors.accent)
    }

    @ViewBuilder
    private func tabContent(for tab: Tab) -> some View {
        switch tab {
        case .flights:
            PlaceholderView(title: "항공권 검색", icon: "airplane.departure", description: "전 세계 항공권을 검색하고 예약하세요")
        case .stays:
            PlaceholderView(title: "숙소 검색", icon: "bed.double", description: "호텔, 에어비앤비 등 숙소를 찾아보세요")
        case .community:
            PlaceholderView(title: "커뮤니티", icon: "person.3.fill", description: "현지 맛집 공유, 동행 구하기")
        case .workspace:
            PlaceholderView(title: "코워킹 스페이스", icon: "desktopcomputer", description: "전 세계 코워킹 스페이스를 검색하세요")
        case .wallet:
            PlaceholderView(title: "여행 지갑", icon: "creditcard.fill", description: "환율 계산, 경비 정산")
        }
    }
}

struct PlaceholderView: View {
    let title: String
    let icon: String
    let description: String

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                Image(systemName: icon)
                    .font(.system(size: 60))
                    .foregroundColor(NomadColors.accent)
                Text(title)
                    .font(NomadFonts.title)
                    .foregroundColor(NomadColors.onSurface)
                Text(description)
                    .font(NomadFonts.body)
                    .foregroundColor(NomadColors.onSurfaceSecondary)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(NomadColors.surface)
            .navigationTitle(title)
        }
    }
}
