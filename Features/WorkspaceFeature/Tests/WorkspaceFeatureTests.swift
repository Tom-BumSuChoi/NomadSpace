import Foundation
import XCTest
@testable import WorkspaceFeature
import WorkspaceFeatureTesting
import WorkspaceFeatureInterface

final class WorkspaceFeatureTests: XCTestCase {
    func test_coworkingSpace_model() {
        let space = PreviewWorkspaces.sampleSpaces[0]
        XCTAssertEqual(space.id, "WS001")
        XCTAssertEqual(space.city, "Bangkok")
        XCTAssertEqual(space.wifiSpeed, 200)
    }

    func test_mockRouting_showWorkspaceSearch() {
        let router = MockWorkspaceFeatureRouting()
        router.showWorkspaceSearch()
        XCTAssertTrue(router.showWorkspaceSearchCalled)
    }

    func test_mockRouting_showDayPassBooking() {
        let router = MockWorkspaceFeatureRouting()
        router.showDayPassBooking(workspaceId: "WS001")
        XCTAssertEqual(router.showDayPassBookingId, "WS001")
    }
}
