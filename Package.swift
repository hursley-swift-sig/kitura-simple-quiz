import PackageDescription

let package = Package(
    name: "kitura-simple-quiz",
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion:0, minor: 17)
    ]
)
