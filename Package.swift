// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Zippy",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Zippy",
            type: .dynamic,
            targets: ["Zippy"]
        ),
    ],
    dependencies: [
        .package(
          url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
          from: "1.9.0"
        ),

        .package(
          url: "https://github.com/sloik/AliasWonderland.git",
          from: "0.0.1"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Zippy",
            dependencies: [
                "AliasWonderland"
            ]
        ),

        .testTarget(
            name: "ZippyTests",
            dependencies: [
                "Zippy",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
            ]
        ),
    ]
)
