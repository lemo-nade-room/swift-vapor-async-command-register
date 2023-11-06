// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "vapor-async-command-register",
  platforms: [.macOS(.v12)],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "AsyncCommandRegister",
      targets: ["AsyncCommandRegister"])
  ],
  dependencies: [
    // 💧 A server-side Swift web framework.
    .package(url: "https://github.com/vapor/vapor.git", from: "4.83.1")
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "AsyncCommandRegister",
      dependencies: [
        .product(name: "Vapor", package: "vapor")
      ]),
    .testTarget(
      name: "AsyncCommandRegisterTests",
      dependencies: ["AsyncCommandRegister"]),
  ]
)
