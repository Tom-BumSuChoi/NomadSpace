import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "HelloTuist",
    targets: [appTarget] + Module.makeTargets(
        name: "Home",
        dependencies: [.external(name: "Alamofire")]
    )
)

let appTarget = Target.target(
    name: "HelloTuist",
    destinations: .iOS,
    product: .app,
    bundleId: "io.tuist.HelloTuist",
    infoPlist: .extendingDefault(with: [
        "UILaunchScreen": [
            "UIColorName": "",
            "UIImageName": "",
        ],
    ]),
    sources: ["App/Sources/**"],
    resources: ["App/Resources/**"],
    dependencies: [
        .target(name: "Home"),
    ]
)
