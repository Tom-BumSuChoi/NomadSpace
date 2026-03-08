import SwiftUI
import DesignSystem
import WorkspaceFeatureInterface

public struct WorkspaceSearchView: View {
    @StateObject private var viewModel: WorkspaceSearchViewModel

    public init(viewModel: WorkspaceSearchViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    searchBar
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
            .navigationTitle("코워킹 스페이스")
        }
    }

    private var searchBar: some View {
        NomadTextField("도시 검색", text: $viewModel.city, icon: "magnifyingglass")
    }

    private var resultsList: some View {
        LazyVStack(spacing: 12) {
            ForEach(viewModel.spaces) { space in
                WorkspaceCard(space: space)
            }
        }
    }
}

struct WorkspaceCard: View {
    let space: CoworkingSpace

    var body: some View {
        NomadCard {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(space.name)
                        .font(NomadFonts.headline)
                        .foregroundColor(NomadColors.onSurface)
                    Spacer()
                    Label("\(space.rating, specifier: "%.1f")", systemImage: "star.fill")
                        .font(NomadFonts.caption)
                        .foregroundColor(NomadColors.highlight)
                }

                Text("\(space.city), \(space.country)")
                    .font(NomadFonts.caption)
                    .foregroundColor(NomadColors.onSurfaceSecondary)

                HStack(spacing: 8) {
                    Label("\(space.wifiSpeed) Mbps", systemImage: "wifi")
                        .font(NomadFonts.small)
                        .foregroundColor(NomadColors.success)
                    Spacer()
                    Text("\(space.currency) \(space.dailyPrice)/일")
                        .font(NomadFonts.headline)
                        .foregroundColor(NomadColors.accent)
                }

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 6) {
                        ForEach(space.amenities, id: \.self) { amenity in
                            Text(amenity)
                                .font(NomadFonts.small)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(NomadColors.surface)
                                .cornerRadius(6)
                        }
                    }
                }
            }
        }
    }
}
