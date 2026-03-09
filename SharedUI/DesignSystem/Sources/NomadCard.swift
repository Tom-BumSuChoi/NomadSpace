import SwiftUI

public struct NomadCard<Content: View>: View {
    private let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        content
            .padding(NomadSpacing.md)
            .background(NomadColors.cardBackground)
            .cornerRadius(NomadRadius.xl)
            .shadow(
                color: NomadShadow.card.color.opacity(NomadShadow.card.opacity),
                radius: NomadShadow.card.radius,
                x: NomadShadow.card.x,
                y: NomadShadow.card.y
            )
    }
}
