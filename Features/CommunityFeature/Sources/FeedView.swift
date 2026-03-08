import SwiftUI
import DesignSystem
import CommunityFeatureInterface

public struct FeedView: View {
    @StateObject private var viewModel: FeedViewModel

    public init(viewModel: FeedViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.posts) { post in
                        PostCard(post: post)
                    }
                }
                .padding()
            }
            .background(NomadColors.surface)
            .navigationTitle("커뮤니티")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { viewModel.showCreatePost = true }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(NomadColors.accent)
                    }
                }
            }
        }
    }
}

struct PostCard: View {
    let post: Post

    var body: some View {
        NomadCard {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Circle()
                        .fill(NomadColors.accent.opacity(0.2))
                        .frame(width: 40, height: 40)
                        .overlay(
                            Text(String(post.authorName.prefix(1)))
                                .font(NomadFonts.headline)
                                .foregroundColor(NomadColors.accent)
                        )
                    VStack(alignment: .leading, spacing: 2) {
                        Text(post.authorName)
                            .font(NomadFonts.headline)
                        Text("\(post.city), \(post.country)")
                            .font(NomadFonts.caption)
                            .foregroundColor(NomadColors.onSurfaceSecondary)
                    }
                    Spacer()
                    Text(post.category.rawValue)
                        .font(NomadFonts.small)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(NomadColors.highlight.opacity(0.1))
                        .cornerRadius(6)
                }

                Text(post.content)
                    .font(NomadFonts.body)
                    .foregroundColor(NomadColors.onSurface)
                    .lineLimit(3)

                HStack(spacing: 16) {
                    Label("\(post.likeCount)", systemImage: "heart")
                    Label("\(post.commentCount)", systemImage: "bubble.right")
                    Spacer()
                }
                .font(NomadFonts.caption)
                .foregroundColor(NomadColors.onSurfaceSecondary)
            }
        }
    }
}
