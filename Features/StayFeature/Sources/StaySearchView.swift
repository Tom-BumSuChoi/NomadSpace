import SwiftUI
import DesignSystem
import TravelDomainInterface

public struct StaySearchView: View {
    @StateObject private var viewModel: StaySearchViewModel

    public init(viewModel: StaySearchViewModel) {
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
            .navigationTitle("숙소 검색")
        }
    }

    private var searchSection: some View {
        NomadCard {
            VStack(spacing: 16) {
                NomadTextField("도시", text: $viewModel.city, icon: "building.2")
                HStack {
                    DatePicker("체크인", selection: $viewModel.checkIn, displayedComponents: .date)
                    DatePicker("체크아웃", selection: $viewModel.checkOut, displayedComponents: .date)
                }
                .font(NomadFonts.caption)
                NomadButton("검색", action: viewModel.search)
            }
        }
    }

    private var resultsList: some View {
        LazyVStack(spacing: 12) {
            ForEach(viewModel.stays) { stay in
                StayResultCard(stay: stay)
            }
        }
    }
}

struct StayResultCard: View {
    let stay: Stay

    var body: some View {
        NomadCard {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(stay.name)
                        .font(NomadFonts.headline)
                        .foregroundColor(NomadColors.onSurface)
                    Spacer()
                    Label("\(stay.rating, specifier: "%.1f")", systemImage: "star.fill")
                        .font(NomadFonts.caption)
                        .foregroundColor(NomadColors.highlight)
                }
                Text("\(stay.city), \(stay.country)")
                    .font(NomadFonts.caption)
                    .foregroundColor(NomadColors.onSurfaceSecondary)
                HStack {
                    Text(stay.type.rawValue.capitalized)
                        .font(NomadFonts.small)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(NomadColors.accent.opacity(0.1))
                        .cornerRadius(6)
                    Spacer()
                    Text("\(stay.currency) \(stay.pricePerNight)/박")
                        .font(NomadFonts.headline)
                        .foregroundColor(NomadColors.accent)
                }
            }
        }
    }
}
