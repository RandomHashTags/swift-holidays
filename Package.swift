// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-holidays",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "SwiftHolidays",
            targets: ["SwiftHolidays"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/RandomHashTags/swift-sovereign-states.git", from: "1.3.2")
    ],
    targets: [
        .target(
            name: "SwiftHolidays",
            dependencies: [
                .product(name: "SwiftSovereignStates", package: "swift-sovereign-states"),
            ],
            path: "./Sources/swift-holidays"
        ),
        .testTarget(
            name: "swift-holidaysTests",
            dependencies: ["SwiftHolidays"]
        ),
    ]
)
