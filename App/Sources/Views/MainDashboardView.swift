import SwiftUI
import ComposableArchitecture
import DesignSystem
import FlightFeature
import StayFeature
import TravelDomainInterface

/// Dumb View - state만 렌더링, action만 전송
/// 문자열·로직은 MainDashboardReducer에서 관리
struct MainDashboardView: View {
    @Bindable var store: StoreOf<MainDashboardReducer>
    var flightSearchUseCase: FlightSearchUseCaseType?
    var staySearchUseCase: StaySearchUseCaseType?

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                headerSection
                mainContent
            }
        }
        .background(NomadColors.surface)
    }

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: NomadSpacing.xxs) {
            Text(store.headerTitle)
                .font(.system(size: NomadFontSize.title, weight: .bold))
                .foregroundColor(NomadColors.accent)
            Text(store.headerSubtitle)
                .font(.system(size: NomadFontSize.caption))
                .foregroundColor(NomadColors.onSurfaceSecondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, NomadSpacing.lg)
        .padding(.vertical, NomadSpacing.md)
        .background(NomadColors.cardBackground)
        .shadow(
            color: NomadShadow.card.color.opacity(NomadShadow.card.opacity),
            radius: NomadShadow.card.radius,
            x: NomadShadow.card.x,
            y: NomadShadow.card.y
        )
    }

    private var mainContent: some View {
        VStack(spacing: 0) {
            searchSection
            quickActionsSection
            popularDestinationsCard
            walletCard
            expenseSettlementCard
        }
        .padding(NomadSpacing.lg)
    }

    private var searchSection: some View {
        HStack(spacing: NomadSpacing.sm) {
            TextField(store.searchPlaceholder, text: $store.searchQuery)
                .font(.system(size: NomadFontSize.body))
                .padding(.horizontal, NomadSpacing.md)
                .padding(.vertical, 14)
                .background(NomadColors.cardBackground)
                .overlay(
                    RoundedRectangle(cornerRadius: NomadRadius.lg)
                        .stroke(Color(white: 0.88), lineWidth: 1)
                )
                .cornerRadius(NomadRadius.lg)
            Button(store.searchButtonTitle) {
                store.send(.searchTapped)
            }
            .font(.system(size: NomadFontSize.body, weight: .semibold))
            .foregroundColor(.white)
            .padding(.horizontal, NomadSpacing.lg)
            .padding(.vertical, 14)
            .background(NomadColors.accent)
            .cornerRadius(NomadRadius.lg)
        }
        .padding(.bottom, NomadSpacing.lg)
    }

    private var quickActionsSection: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: NomadSpacing.sm), count: 4), spacing: NomadSpacing.sm) {
            ForEach(Array(store.quickActions.enumerated()), id: \.offset) { index, item in
                quickActionButton(for: item, at: index)
            }
        }
        .padding(.bottom, NomadSpacing.xl)
    }

    @ViewBuilder
    private func quickActionButton(for item: MainDashboardReducer.QuickActionItem, at index: Int) -> some View {
        switch (index, flightSearchUseCase, staySearchUseCase) {
        case (0, let useCase?, _):
            NavigationLink {
                FlightSearchView(flightSearchUseCase: useCase)
            } label: {
                QuickActionItemView(emoji: item.emoji, title: item.title)
            }
            .buttonStyle(.plain)
        case (1, _, let useCase?):
            NavigationLink {
                StaySearchView(viewModel: StaySearchViewModel(staySearchUseCase: useCase))
            } label: {
                QuickActionItemView(emoji: item.emoji, title: item.title)
            }
            .buttonStyle(.plain)
        default:
            Button {
                store.send(.quickActionTapped(item))
            } label: {
                QuickActionItemView(emoji: item.emoji, title: item.title)
            }
            .buttonStyle(.plain)
        }
    }

    private var popularDestinationsCard: some View {
        VStack(alignment: .leading, spacing: NomadSpacing.sm) {
            Text(store.popularDestinationsTitle)
                .font(.system(size: NomadFontSize.headline, weight: .semibold))
                .foregroundColor(NomadColors.onSurface)
            ForEach(Array(store.popularDestinations.enumerated()), id: \.offset) { _, item in
                ListItemRowView(title: item.title, subtitle: item.subtitle, price: item.price)
            }
        }
        .padding(NomadSpacing.lg)
        .background(NomadColors.cardBackground)
        .cornerRadius(NomadRadius.lg)
        .shadow(
            color: NomadShadow.card.color.opacity(NomadShadow.card.opacity),
            radius: NomadShadow.card.radius,
            x: NomadShadow.card.x,
            y: NomadShadow.card.y
        )
        .padding(.bottom, NomadSpacing.md)
    }

    private var walletCard: some View {
        VStack(alignment: .leading, spacing: NomadSpacing.xxs) {
            Text(store.walletLabel)
                .font(.system(size: NomadFontSize.caption))
                .foregroundColor(.white.opacity(0.9))
            Text(store.walletAmount)
                .font(.system(size: NomadFontSize.largeTitle, weight: .bold))
                .foregroundColor(.white)
            Text(store.walletSubAmount)
                .font(.system(size: NomadFontSize.caption))
                .foregroundColor(.white.opacity(0.9))
                .padding(.top, NomadSpacing.xs)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(NomadSpacing.xl)
        .background(
            LinearGradient(
                colors: [NomadColors.accent, NomadColors.accentDark],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(NomadRadius.lg)
        .padding(.bottom, NomadSpacing.lg)
    }

    private var expenseSettlementCard: some View {
        VStack(alignment: .leading, spacing: NomadSpacing.sm) {
            Text(store.expenseSettlementTitle)
                .font(.system(size: NomadFontSize.headline, weight: .semibold))
                .foregroundColor(NomadColors.onSurface)
            ForEach(Array(store.expenseItems.enumerated()), id: \.offset) { _, item in
                ListItemRowView(title: item.title, subtitle: item.subtitle, price: item.price)
            }
        }
        .padding(NomadSpacing.lg)
        .background(NomadColors.cardBackground)
        .cornerRadius(NomadRadius.lg)
        .shadow(
            color: NomadShadow.card.color.opacity(NomadShadow.card.opacity),
            radius: NomadShadow.card.radius,
            x: NomadShadow.card.x,
            y: NomadShadow.card.y
        )
    }
}

private struct QuickActionItemView: View {
    let emoji: String
    let title: String

    var body: some View {
        VStack(spacing: NomadSpacing.xs) {
            Text(emoji)
                .font(.system(size: 24))
                .frame(width: 40, height: 40)
                .background(NomadColors.accent.opacity(0.1))
                .cornerRadius(NomadRadius.icon)
            Text(title)
                .font(.system(size: NomadFontSize.caption, weight: .medium))
                .foregroundColor(NomadColors.onSurface)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, NomadSpacing.md)
        .padding(.horizontal, NomadSpacing.xs)
        .background(NomadColors.cardBackground)
        .cornerRadius(NomadRadius.lg)
        .shadow(
            color: NomadShadow.card.color.opacity(NomadShadow.card.opacity),
            radius: NomadShadow.card.radius,
            x: NomadShadow.card.x,
            y: NomadShadow.card.y
        )
    }
}

private struct ListItemRowView: View {
    let title: String
    let subtitle: String
    let price: String

    var body: some View {
        HStack(spacing: NomadSpacing.md) {
            RoundedRectangle(cornerRadius: NomadRadius.md)
                .fill(NomadColors.surface)
                .frame(width: 56, height: 56)
            VStack(alignment: .leading, spacing: NomadSpacing.xxs) {
                Text(title)
                    .font(.system(size: NomadFontSize.body, weight: .semibold))
                    .foregroundColor(NomadColors.onSurface)
                Text(subtitle)
                    .font(.system(size: NomadFontSize.caption))
                    .foregroundColor(NomadColors.onSurfaceSecondary)
            }
            Spacer()
            Text(price)
                .font(.system(size: NomadFontSize.body, weight: .bold))
                .foregroundColor(NomadColors.accent)
        }
        .padding(NomadSpacing.md)
        .background(NomadColors.cardBackground)
        .cornerRadius(NomadRadius.lg)
        .shadow(
            color: NomadShadow.card.color.opacity(NomadShadow.card.opacity),
            radius: NomadShadow.card.radius,
            x: NomadShadow.card.x,
            y: NomadShadow.card.y
        )
    }
}

#Preview {
    MainDashboardView(
        store: Store(initialState: MainDashboardReducer.State()) {
            MainDashboardReducer()
        },
        flightSearchUseCase: nil,
        staySearchUseCase: nil
    )
}
