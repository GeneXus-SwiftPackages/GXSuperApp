// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXSuperApp",
	platforms: [.iOS("15.0"), .tvOS("18.0"), .visionOS("2.0")],
	products: [
		.library(
			name: "GXSuperApp",
			targets: ["GXSuperAppWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "3.2.0-beta.9"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXGAM.git", exact: "3.2.0-beta.9")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXSuperApp-3.2.0-beta.9.xcframework.zip",
			checksum: "f442378612685180ba5ec6739c451698899d1f5c4424731d66519f083f795af8"
		)
	]
)