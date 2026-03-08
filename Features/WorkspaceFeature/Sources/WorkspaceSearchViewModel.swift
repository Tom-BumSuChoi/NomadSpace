import Foundation
import WorkspaceFeatureInterface
import NetworkCoreInterface

@MainActor
public final class WorkspaceSearchViewModel: ObservableObject {
    @Published public var city: String = ""
    @Published public var spaces: [CoworkingSpace] = []
    @Published public var isLoading: Bool = false

    private let networkClient: NetworkClientType

    public init(networkClient: NetworkClientType) {
        self.networkClient = networkClient
    }

    public func search() {
        guard !city.isEmpty else { return }
        isLoading = true

        Task {
            do {
                let endpoint = Endpoint(
                    path: "/v1/workspaces/search",
                    queryItems: [URLQueryItem(name: "city", value: city)]
                )
                spaces = try await networkClient.request(endpoint)
            } catch {
                spaces = []
            }
            isLoading = false
        }
    }
}
