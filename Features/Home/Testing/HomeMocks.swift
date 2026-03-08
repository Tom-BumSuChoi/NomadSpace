import Foundation
import HomeInterface

public final class MockHomeViewModel: HomeViewModelType {
    public var title: String

    public init(title: String = "Mock Home") {
        self.title = title
    }
}
