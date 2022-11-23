// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FCL",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "FCL",
            targets: ["FCL"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/outblock/flow-swift.git", .exact("0.2.9")),
        .package(url: "https://github.com/daltoniam/Starscream", .exact("3.1.1")),
        .package(url: "https://github.com/WalletConnect/WalletConnectSwiftV2", .exact("1.0.5")),
        .package(url: "https://github.com/apple/swift-collections", .exact("1.0.3"))
    ],
    targets: [
        .target(
            name: "FCL",
            dependencies: [
                .product(name: "Flow", package: "flow-swift"),
                .product(name: "Starscream", package: "Starscream"),
                .product(name: "WalletConnect", package: "WalletConnectSwiftV2"),
                .product(name: "WalletConnectAuth", package: "WalletConnectSwiftV2"),
                .product(name: "OrderedCollections", package: "swift-collections"),
            ],
            path: "Sources/FCL"
        ),
        .testTarget(
            name: "FCLTests",
            dependencies: ["FCL"],
            path: "Tests"
        ),
    ]
)
