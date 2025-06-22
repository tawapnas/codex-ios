// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Wayfinder",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "Wayfinder", targets: ["Wayfinder"])
    ],
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0")
    ],
    targets: [
        .target(
            name: "Wayfinder",
            dependencies: ["Swinject"],
            path: ".",
            exclude: ["agents.md", "README.md"],
            sources: ["Models", "Services", "Utilities", "ViewModels", "Views", "WayfinderApp.swift"]
        )
    ]
)
