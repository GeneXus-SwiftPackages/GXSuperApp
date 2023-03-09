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
			url: "https://pkgs.genexus.dev/iOS/beta/GXSuperApp-1.0.0-beta+20230309142042.xcframework.zip",
			checksum: "e8e32d2b54459d6903baf69772628191ff5e33fc6560ec6a021bc98d6a97a69e"
		)
	]
)