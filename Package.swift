// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PerfectLDAP",
    products: [
        .library(
            name: "PerfectLDAP",
            targets: ["PerfectLDAP"]),
    ],
    dependencies: [
        .package(name: "PerfectICONV", url: "https://github.com/frets1700/Perfect-ICONV.git", .branch("master")),
        .package(name: "SASL", url: "https://github.com/PerfectlySoft/Perfect-libSASL.git", from: "1.0.0"),
        .package(name: "OpenLDAP", url: "https://github.com/PerfectlySoft/Perfect-OpenLDAP.git", from: "1.0.0"),
    ],
    targets: [
        .target(name: "CTime", dependencies: []),
        .target(
            name: "PerfectLDAP",
            dependencies: [
                .target(name: "CTime"),
                .product(name: "PerfectICONV", package: "PerfectICONV"),
                .product(name: "SASL", package: "SASL"),
                .product(name: "OpenLDAP", package: "OpenLDAP")
            ]),
        .testTarget(
            name: "PerfectLDAPTests",
            dependencies: ["PerfectLDAP"]),
    ]
)
