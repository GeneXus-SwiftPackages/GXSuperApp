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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "3.2.0-rc.10"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXGAM.git", exact: "3.2.0-rc.10")
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXSuperApp-3.2.0-rc.10.xcframework.zip",
			checksum: "e73c878a6328169fecb393ee4c184b64fb9874a652a4beaf6053f1f4fa163c66"
		)
	]
)