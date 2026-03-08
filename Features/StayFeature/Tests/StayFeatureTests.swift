import Foundation
import XCTest
@testable import StayFeature
import StayFeatureTesting

final class StayFeatureTests: XCTestCase {
    func test_mockRouting_showStaySearch() {
        let router = MockStayFeatureRouting()
        router.showStaySearch()
        XCTAssertTrue(router.showStaySearchCalled)
    }

    func test_mockRouting_showStayDetail() {
        let router = MockStayFeatureRouting()
        router.showStayDetail(stayId: "ST001")
        XCTAssertEqual(router.showStayDetailId, "ST001")
    }
}
