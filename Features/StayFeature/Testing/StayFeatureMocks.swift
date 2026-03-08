import Foundation
import StayFeatureInterface

public final class MockStayFeatureRouting: StayFeatureRouting {
    public var showStaySearchCalled = false
    public var showStayDetailId: String?
    public var showBookingConfirmationId: String?

    public init() {}

    public func showStaySearch() {
        showStaySearchCalled = true
    }

    public func showStayDetail(stayId: String) {
        showStayDetailId = stayId
    }

    public func showBookingConfirmation(stayId: String, checkIn: Date, checkOut: Date) {
        showBookingConfirmationId = stayId
    }
}
