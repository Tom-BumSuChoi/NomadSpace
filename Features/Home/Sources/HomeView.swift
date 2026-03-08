import SwiftUI
import HomeInterface

public struct HomeView: View {
    public init() {}

    public var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
