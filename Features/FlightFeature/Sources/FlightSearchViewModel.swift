import Foundation
import TravelDomainInterface

@MainActor
public final class FlightSearchViewModel: ObservableObject {
    @Published public var origin: String = ""
    @Published public var destination: String = ""
    @Published public var departureDate: Date = Date()
    @Published public var flights: [Flight] = []
    @Published public var isLoading: Bool = false
    @Published public var errorMessage: String?

    private let flightSearchUseCase: FlightSearchUseCaseType

    public init(flightSearchUseCase: FlightSearchUseCaseType) {
        self.flightSearchUseCase = flightSearchUseCase
    }

    public func search() {
        guard !origin.isEmpty, !destination.isEmpty else { return }
        isLoading = true
        errorMessage = nil

        Task {
            do {
                flights = try await flightSearchUseCase.searchFlights(
                    from: origin,
                    to: destination,
                    date: departureDate,
                    cabinClass: .economy
                )
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
}
