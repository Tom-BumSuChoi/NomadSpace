import ProjectDescription

public enum Module {
    public static func makeTargets(
        name: String,
        destinations: Destinations = .iOS,
        dependencies: [TargetDependency] = [],
        interfaceDependencies: [TargetDependency] = [],
        hasResources: Bool = false
    ) -> [Target] {
        let interface = Target.target(
            name: "\(name)Interface",
            destinations: destinations,
            product: .framework,
            bundleId: "io.tuist.\(name)Interface",
            sources: ["Features/\(name)/Interface/**"],
            dependencies: interfaceDependencies
        )

        let resources: ResourceFileElements? = hasResources
            ? ["Features/\(name)/Resources/**"]
            : nil

        let source = Target.target(
            name: name,
            destinations: destinations,
            product: .framework,
            bundleId: "io.tuist.\(name)",
            sources: ["Features/\(name)/Sources/**"],
            resources: resources,
            dependencies: [.target(name: "\(name)Interface")] + dependencies
        )

        let testing = Target.target(
            name: "\(name)Testing",
            destinations: destinations,
            product: .framework,
            bundleId: "io.tuist.\(name)Testing",
            sources: ["Features/\(name)/Testing/**"],
            dependencies: [.target(name: "\(name)Interface")]
        )

        let tests = Target.target(
            name: "\(name)Tests",
            destinations: destinations,
            product: .unitTests,
            bundleId: "io.tuist.\(name)Tests",
            infoPlist: .default,
            sources: ["Features/\(name)/Tests/**"],
            dependencies: [
                .target(name: name),
                .target(name: "\(name)Testing"),
            ]
        )

        let example = Target.target(
            name: "\(name)Example",
            destinations: destinations,
            product: .app,
            bundleId: "io.tuist.\(name)Example",
            infoPlist: .extendingDefault(with: [
                "UILaunchScreen": [
                    "UIColorName": "",
                    "UIImageName": "",
                ],
            ]),
            sources: ["Features/\(name)/Example/Sources/**"],
            dependencies: [
                .target(name: name),
                .target(name: "\(name)Testing"),
            ]
        )

        return [interface, source, testing, tests, example]
    }
}
