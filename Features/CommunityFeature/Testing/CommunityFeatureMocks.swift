import Foundation
import CommunityFeatureInterface

public final class MockCommunityFeatureRouting: CommunityFeatureRouting {
    public var showFeedCalled = false
    public var showPostDetailId: String?
    public var showCreatePostCalled = false

    public init() {}

    public func showFeed() { showFeedCalled = true }
    public func showPostDetail(postId: String) { showPostDetailId = postId }
    public func showCreatePost() { showCreatePostCalled = true }
}

public enum PreviewPosts {
    public static let samplePosts: [Post] = [
        Post(
            id: "P001", authorId: "U1", authorName: "서연",
            authorImageURL: nil,
            content: "치앙마이 님만해민 로드에 새로 생긴 카페 추천! WiFi 빠르고 콘센트 많아서 작업하기 최고예요 ☕️",
            imageURLs: [], category: .cafe,
            city: "Chiang Mai", country: "Thailand",
            likeCount: 42, commentCount: 8, createdAt: Date()
        ),
        Post(
            id: "P002", authorId: "U2", authorName: "Nomad Jake",
            authorImageURL: nil,
            content: "발리 우붓에서 한 달 살기 중입니다. 같이 저녁 먹을 분 구합니다! 🌴",
            imageURLs: [], category: .companion,
            city: "Ubud", country: "Indonesia",
            likeCount: 28, commentCount: 15, createdAt: Date()
        ),
    ]
}
