import SwiftUI
import DesignSystem
import TravelDomainInterface

public struct FlightSearchView: View {
    @StateObject private var viewModel: FlightSearchViewModel

    public init(viewModel: FlightSearchViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    searchSection
                    if viewModel.isLoading {
                        ProgressView()
                            .padding(.top, 40)
                    } else {
                        resultsList
                    }
                }
                .padding()
            }
            .background(NomadColors.surface)
            .navigationTitle("항공권 검색")
        }
    }

    private var searchSection: some View {
        NomadCard {
            VStack(spacing: 16) {
                NomadTextField("출발지", text: $viewModel.origin, icon: "airplane.departure")
                NomadTextField("도착지", text: $viewModel.destination, icon: "airplane.arrival")
                DatePicker("출발일", selection: $viewModel.departureDate, displayedComponents: .date)
                    .font(NomadFonts.body)
                NomadButton("검색", action: viewModel.search)
            }
        }
    }

    private var resultsList: some View {
        LazyVStack(spacing: 12) {
            ForEach(viewModel.flights) { flight in
                FlightResultCard(flight: flight)
            }
        }
    }
}

struct FlightResultCard: View {
    let flight: Flight

    var body: some View {
        NomadCard {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(flight.airline)
                        .font(NomadFonts.headline)
                        .foregroundColor(NomadColors.onSurface)
                    Spacer()
                    Text(flight.flightNumber)
                        .font(NomadFonts.caption)
                        .foregroundColor(NomadColors.onSurfaceSecondary)
                }

                HStack {
                    Text(flight.departure.code)
                        .font(NomadFonts.title)
                    Image(systemName: "arrow.right")
                        .foregroundColor(NomadColors.accent)
                    Text(flight.arrival.code)
                        .font(NomadFonts.title)
                    Spacer()
                    Text("\(flight.currency) \(flight.price)")
                        .font(NomadFonts.headline)
                        .foregroundColor(NomadColors.accent)
                }
            }
        }
    }
}
