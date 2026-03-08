import Foundation
import XCTest
@testable import FlightFeature
import FlightFeatureTesting

final class FlightFeatureTests: XCTestCase {
    func test_mockRouting_showFlightSearch() {
        let router = MockFlightFeatureRouting()
        router.showFlightSearch()
        XCTAssertTrue(router.showFlightSearchCalled)
    }

    func test_mockRouting_showFlightDetail() {
        let router = MockFlightFeatureRouting()
        router.showFlightDetail(flightId: "FL001")
        XCTAssertEqual(router.showFlightDetailId, "FL001")
    }
}
