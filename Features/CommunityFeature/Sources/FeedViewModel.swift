import Foundation
import CommunityFeatureInterface
import NetworkCoreInterface

@MainActor
public final class FeedViewModel: ObservableObject {
    @Published public var posts: [Post] = []
    @Published public var isLoading: Bool = false
    @Published public var showCreatePost: Bool = false

    private let networkClient: NetworkClientType

    public init(networkClient: NetworkClientType) {
        self.networkClient = networkClient
    }

    public func loadFeed() {
        isLoading = true
        Task {
            do {
                let endpoint = Endpoint(path: "/v1/community/feed")
                posts = try await networkClient.request(endpoint)
            } catch {
                posts = []
            }
            isLoading = false
        }
    }
}
