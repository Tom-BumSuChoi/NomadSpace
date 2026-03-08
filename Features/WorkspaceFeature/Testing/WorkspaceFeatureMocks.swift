import Foundation
import WorkspaceFeatureInterface

public final class MockWorkspaceFeatureRouting: WorkspaceFeatureRouting {
    public var showWorkspaceSearchCalled = false
    public var showWorkspaceDetailId: String?
    public var showDayPassBookingId: String?

    public init() {}

    public func showWorkspaceSearch() { showWorkspaceSearchCalled = true }
    public func showWorkspaceDetail(workspaceId: String) { showWorkspaceDetailId = workspaceId }
    public func showDayPassBooking(workspaceId: String) { showDayPassBookingId = workspaceId }
}

public enum PreviewWorkspaces {
    public static let sampleSpaces: [CoworkingSpace] = [
        CoworkingSpace(
            id: "WS001", name: "Hubba Thailand",
            address: "Ekkamai Soi 4", city: "Bangkok", country: "Thailand",
            latitude: 13.7231, longitude: 100.5831,
            wifiSpeed: 200, dailyPrice: 350, currency: "THB",
            rating: 4.7,
            amenities: ["WiFi", "Meeting Room", "Coffee", "Standing Desk", "24/7"],
            openingHours: "24/7", imageURLs: []
        ),
        CoworkingSpace(
            id: "WS002", name: "Dojo Bali",
            address: "Jl. Batu Mejan", city: "Canggu", country: "Indonesia",
            latitude: -8.6478, longitude: 115.1385,
            wifiSpeed: 100, dailyPrice: 150000, currency: "IDR",
            rating: 4.5,
            amenities: ["WiFi", "Pool", "Cafe", "Events"],
            openingHours: "08:00 - 22:00", imageURLs: []
        ),
    ]
}
