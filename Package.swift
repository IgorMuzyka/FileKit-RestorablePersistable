// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "RestorablePersistable",
    products: [
        .library(name: "RestorablePersistable", targets: ["RestorablePersistable"])
    ],
    dependencies: [
        .package(url: "https://github.com/nvzqz/FileKit", from: "5.1.0"),
    ],
    targets: [
        .target(
            name: "RestorablePersistable",
            dependencies: ["FileKit"],
            path: "Sources"),
    ]
)
