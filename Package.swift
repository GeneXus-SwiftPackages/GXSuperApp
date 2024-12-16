// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXSuperApp",
	platforms: [.iOS("13.0"), .tvOS("13.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXSuperApp",
			targets: ["GXSuperAppWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "2.2.0-beta.24"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXGAM.git", exact: "2.2.0-beta.24")
	],
	targets: [
		.target(name: "GXSuperAppWrapper",
				dependencies: [
					"GXSuperApp",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .tvOS, .visionOS])),
					.product(name: "GXGAM", package: "GXGAM", condition: .when(platforms: [.iOS, .tvOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXSuperApp",
			url: "https://pkgs.genexus.dev/iOS/beta/GXSuperApp-2.2.0-beta.24.xcframework.zip",
			checksum: "90b9f5a087f52e6d5db45f4897301b984777ad30802ecf11e770340e6a74867d"
		)
	]
)