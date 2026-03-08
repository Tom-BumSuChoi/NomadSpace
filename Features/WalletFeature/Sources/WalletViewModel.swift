import Foundation
import PaymentDomainInterface

@MainActor
public final class WalletViewModel: ObservableObject {
    @Published public var amount: String = ""
    @Published public var fromCurrency: String = "KRW"
    @Published public var toCurrency: String = "USD"
    @Published public var convertedAmount: String?
    @Published public var transactions: [Transaction] = []
    @Published public var isLoading: Bool = false

    private let exchangeRateUseCase: ExchangeRateUseCaseType
    private let splitBillUseCase: SplitBillUseCaseType

    public init(
        exchangeRateUseCase: ExchangeRateUseCaseType,
        splitBillUseCase: SplitBillUseCaseType
    ) {
        self.exchangeRateUseCase = exchangeRateUseCase
        self.splitBillUseCase = splitBillUseCase
    }

    public func convert() {
        guard let amountValue = Decimal(string: amount) else { return }
        isLoading = true

        Task {
            do {
                let result = try await exchangeRateUseCase.convert(
                    amount: amountValue,
                    from: fromCurrency,
                    to: toCurrency
                )
                convertedAmount = "\(result)"
            } catch {
                convertedAmount = nil
            }
            isLoading = false
        }
    }

    public func loadTransactions(tripId: String) {
        Task {
            do {
                transactions = try await splitBillUseCase.getTransactions(tripId: tripId)
            } catch {
                transactions = []
            }
        }
    }
}
