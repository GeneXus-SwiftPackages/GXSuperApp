// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXSuperApp",
	platforms: [.iOS("12.0"), .tvOS("12.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXSuperApp",
			targets: ["GXSuperAppWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "2.0.0-rc.32")
	],
	targets: [
		.target(name: "GXSuperAppWrapper",
				dependencies: [
					"GXSuperApp",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .tvOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXSuperApp",
			url: "https://pkgs.genexus.dev/iOS/preview/GXSuperApp-2.0.0-rc.32.xcframework.zip",
			checksum: "7c3f6a585a6558c3d080a0b877996faabbf9baa16ae0485e535f31f1053851b7"
		)
	]
)