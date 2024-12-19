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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "2.2.0-beta.26"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXGAM.git", exact: "2.2.0-beta.26")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXSuperApp-2.2.0-beta.26.xcframework.zip",
			checksum: "77ea20bcab209da34afa2d58df6d1148a83ced2ba680bc5e1ace12ba82290f79"
		)
	]
)