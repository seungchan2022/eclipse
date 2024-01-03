// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "eclipse",
  products: [
    .library(
      name: "eclipse",
      targets: ["eclipse"]),
  ],
  dependencies: [
    .package(url: "https://github.com/airbnb/swift", from: "1.0.6"),
  ],
  targets: [
    .target(
      name: "eclipse"),
    .testTarget(
      name: "eclipseTests",
      dependencies: ["eclipse"]),
  ])
