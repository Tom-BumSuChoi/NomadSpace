import Foundation
import XCTest
@testable import WalletFeature
import WalletFeatureTesting

final class WalletFeatureTests: XCTestCase {
    func test_mockRouting_showWallet() {
        let router = MockWalletFeatureRouting()
        router.showWallet()
        XCTAssertTrue(router.showWalletCalled)
    }

    func test_mockRouting_showSplitBill() {
        let router = MockWalletFeatureRouting()
        router.showSplitBill(tripId: "TRIP001")
        XCTAssertEqual(router.showSplitBillTripId, "TRIP001")
    }
}
