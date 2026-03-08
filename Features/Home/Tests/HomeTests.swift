import Foundation
import XCTest
@testable import Home
import HomeTesting

final class HomeTests: XCTestCase {
    func test_homeView_canBeCreated() {
        let view = HomeView()
        XCTAssertNotNil(view)
    }

    func test_mockViewModel_hasDefaultTitle() {
        let viewModel = MockHomeViewModel()
        XCTAssertEqual(viewModel.title, "Mock Home")
    }
}
