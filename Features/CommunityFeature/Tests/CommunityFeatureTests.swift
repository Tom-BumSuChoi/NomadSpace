import Foundation
import XCTest
@testable import CommunityFeature
import CommunityFeatureTesting
import CommunityFeatureInterface

final class CommunityFeatureTests: XCTestCase {
    func test_post_model() {
        let post = PreviewPosts.samplePosts[0]
        XCTAssertEqual(post.id, "P001")
        XCTAssertEqual(post.category, .cafe)
        XCTAssertEqual(post.city, "Chiang Mai")
    }

    func test_mockRouting_showFeed() {
        let router = MockCommunityFeatureRouting()
        router.showFeed()
        XCTAssertTrue(router.showFeedCalled)
    }

    func test_postCategory_allCases() {
        XCTAssertEqual(PostCategory.allCases.count, 6)
    }
}
