// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Authentication",
  platforms: [
    .iOS(.v17),
  ],
  products: [
    .library(
      name: "Authentication",
      targets: ["Authentication"]),
  ],
  dependencies: [
    .package(path: "../../Core/Architecture"),
  ],
  targets: [
    .target(
      name: "Authentication",
      dependencies: [
        "Architecture",
      ]),
    .testTarget(
      name: "AuthenticationTests",
      dependencies: ["Authentication"]),
  ]
)
