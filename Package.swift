// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Dependency",
    platforms: [.macOS(.v10_15), .iOS(.v15), .tvOS(.v15), .watchOS(.v6), .visionOS(.v1)],
    products: [
        .library(
            name: "Dependency",
            targets: ["Dependency"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Dependency",
            dependencies: []
        ),
        .testTarget(
            name: "DependencyTests",
            dependencies: ["Dependency"]),
    ]
)
