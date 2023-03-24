// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXSuperApp",
	platforms: [.iOS("12.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXSuperApp",
			targets: ["GXSuperAppWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", branch: "beta")
	],
	targets: [
		.target(name: "GXSuperAppWrapper",
				dependencies: [
					"GXSuperApp",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.iOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXSuperApp",
			url: "https://pkgs.genexus.dev/iOS/beta/GXSuperApp-1.0.0-beta+20230324153906.xcframework.zip",
			checksum: "5f336cfe2c3dcefbbdee41043fef4dd3e3582cd84e92d0fe84ea3b6137784861"
		)
	]
)