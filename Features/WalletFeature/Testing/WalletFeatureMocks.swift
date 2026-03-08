import Foundation
import WalletFeatureInterface

public final class MockWalletFeatureRouting: WalletFeatureRouting {
    public var showWalletCalled = false
    public var showExchangeRateCalled = false
    public var showSplitBillTripId: String?
    public var showTransactionDetailId: String?

    public init() {}

    public func showWallet() { showWalletCalled = true }
    public func showExchangeRate() { showExchangeRateCalled = true }
    public func showSplitBill(tripId: String) { showSplitBillTripId = tripId }
    public func showTransactionDetail(transactionId: String) { showTransactionDetailId = transactionId }
}
