// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "TicTacToe",
    products: [
        .library(
            name: "TicTacToe",
            targets: ["TicTacToe"]),
    ],
    targets: [
        .target(
            name: "TicTacToe",
            path: "Sources"),
        .testTarget(
            name: "Tests",
            dependencies: ["TicTacToe"],
            path: "Tests"
        ),
    ]
)
