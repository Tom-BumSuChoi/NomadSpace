import Foundation
import TravelDomainInterface

@MainActor
public final class StaySearchViewModel: ObservableObject {
    @Published public var city: String = ""
    @Published public var checkIn: Date = Date()
    @Published public var checkOut: Date = Date().addingTimeInterval(86400)
    @Published public var guests: Int = 1
    @Published public var stays: [Stay] = []
    @Published public var isLoading: Bool = false
    @Published public var errorMessage: String?

    private let staySearchUseCase: StaySearchUseCaseType

    public init(staySearchUseCase: StaySearchUseCaseType) {
        self.staySearchUseCase = staySearchUseCase
    }

    public func search() {
        guard !city.isEmpty else { return }
        isLoading = true
        errorMessage = nil

        Task {
            do {
                stays = try await staySearchUseCase.searchStays(
                    city: city,
                    checkIn: checkIn,
                    checkOut: checkOut,
                    guests: guests
                )
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
}
