import Foundation
import FlightFeatureInterface

public final class MockFlightFeatureRouting: FlightFeatureRouting {
    public var showFlightSearchCalled = false
    public var showFlightDetailId: String?
    public var showBookingConfirmationId: String?

    public init() {}

    public func showFlightSearch() {
        showFlightSearchCalled = true
    }

    public func showFlightDetail(flightId: String) {
        showFlightDetailId = flightId
    }

    public func showBookingConfirmation(flightId: String) {
        showBookingConfirmationId = flightId
    }
}
