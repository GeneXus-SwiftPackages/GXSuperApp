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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "1.1.0-rc.4")
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXSuperApp-1.1.0-rc.4.xcframework.zip",
			checksum: "1da5f504513ff418dd155d893c0e92a7f64527503e76e304be576159ae470f8c"
		)
	]
)