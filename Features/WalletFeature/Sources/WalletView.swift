import SwiftUI
import DesignSystem
import PaymentDomainInterface

public struct WalletView: View {
    @StateObject private var viewModel: WalletViewModel

    public init(viewModel: WalletViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    exchangeRateCard
                    recentTransactionsSection
                }
                .padding()
            }
            .background(NomadColors.surface)
            .navigationTitle("지갑")
        }
    }

    private var exchangeRateCard: some View {
        NomadCard {
            VStack(spacing: 16) {
                HStack {
                    Text("환율 계산")
                        .font(NomadFonts.headline)
                    Spacer()
                }
                HStack(spacing: 12) {
                    NomadTextField("금액", text: $viewModel.amount, icon: "wonsign.circle")
                    Text(viewModel.fromCurrency)
                        .font(NomadFonts.body)
                        .foregroundColor(NomadColors.onSurfaceSecondary)
                }
                if let converted = viewModel.convertedAmount {
                    HStack {
                        Image(systemName: "arrow.down")
                            .foregroundColor(NomadColors.accent)
                        Text("\(converted) \(viewModel.toCurrency)")
                            .font(NomadFonts.title)
                            .foregroundColor(NomadColors.accent)
                        Spacer()
                    }
                }
                NomadButton("환전 계산", style: .secondary, action: viewModel.convert)
            }
        }
    }

    private var recentTransactionsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("최근 거래")
                .font(NomadFonts.headline)
                .foregroundColor(NomadColors.onSurface)

            ForEach(viewModel.transactions) { transaction in
                NomadCard {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(transaction.description)
                                .font(NomadFonts.body)
                            Text(transaction.category.rawValue.capitalized)
                                .font(NomadFonts.caption)
                                .foregroundColor(NomadColors.onSurfaceSecondary)
                        }
                        Spacer()
                        Text("\(transaction.currency) \(transaction.amount)")
                            .font(NomadFonts.headline)
                            .foregroundColor(NomadColors.onSurface)
                    }
                }
            }
        }
    }
}
