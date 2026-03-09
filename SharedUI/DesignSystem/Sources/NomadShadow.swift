import SwiftUI

/// figma-prototype/index.html 기준 그림자
public enum NomadShadow {
    /// 카드 기본 그림자: 0 2 8, opacity 0.06
    public static let card: (color: Color, radius: CGFloat, x: CGFloat, y: CGFloat, opacity: Double) = (
        Color.black,
        8,
        0,
        2,
        0.06
    )

    /// 탭바 그림자: 0 -2 10, opacity 0.05
    public static let tabBar: (color: Color, radius: CGFloat, x: CGFloat, y: CGFloat, opacity: Double) = (
        Color.black,
        10,
        0,
        -2,
        0.05
    )
}
