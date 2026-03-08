import SwiftUI
import FlightFeature
import StayFeature
import WalletFeature
import CommunityFeature
import WorkspaceFeature
import TravelDomainInterface
import PaymentDomainInterface
import NetworkCoreInterface

@main
struct NomadSpaceApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
