# Dependency
[![Swift Version](https://img.shields.io/badge/Swift-6+-orange.svg)](https://swift.org)
[![iOS](https://img.shields.io/badge/iOS-15.0+-lightgrey.svg)](https://developer.apple.com/ios/)
[![macOS](https://img.shields.io/badge/macOS-10.15+-lightgrey.svg)](https://developer.apple.com/macos/)
[![tvOS](https://img.shields.io/badge/tvOS-15.0+-lightgrey.svg)](https://developer.apple.com/tvos/)
[![watchOS](https://img.shields.io/badge/watchOS-6.0+-lightgrey.svg)](https://developer.apple.com/watchos/)
[![visionOS](https://img.shields.io/badge/visionOS-1.0+-lightgrey.svg)](https://developer.apple.com/visionos/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

A minimalistic, lightweight, type-safe dependency injection framework for Swift, inspired by [swift-dependencies](https://github.com/pointfreeco/swift-dependencies) and [SwiftLee's dependency injection approach](https://www.avanderlee.com/swift/dependency-injection/).

## Overview

This library provides a simple way to manage dependencies in your Swift applications using property wrappers. It allows you to:

- Define dependencies using a protocol-based approach
- Easily inject dependencies into your types
- Swap implementations at runtime (especially useful for testing)
- Use a clean, declarative syntax

## Requirements

- Swift 6.0+
- Platforms:
  - macOS 10.15+
  - iOS 15+
  - tvOS 15+
  - watchOS 6+
  - visionOS 1+

## Installation

### Using Xcode (Swift Package Manager)

1. Open your Xcode project.
2. Navigate to **File > Swift Packages > Add Package Dependency…**
3. Enter the repository URL:  
   `https://github.com/emarashliev/dependency.git`

### Adding via Package.swift

Include the package dependency in your Package.swift file as shown below:

```swift

let package = Package(
    name: "YourProject",
    dependencies: [
        .package(url: "https://github.com/emarashliev/dependency.git", branch: "main")
    ],
    targets: [
        .target(
            name: "YourProject",
            dependencies: ["Dependency"]
        )
    ]
)

```

## Usage

### Defining a Dependency

There are two ways to define a dependency:

#### 1. Using a separate key type

```swift
protocol MyService: Sendable {
    func doSomething() -> String
}

struct DefaultMyService: MyService {
    func doSomething() -> String {
        "Default implementation"
    }
}

struct MyServiceKey: DependencyKey {
    static let currentValue: MyService = DefaultMyService()
}

extension DependencyValues {
    var myService: MyService {
        get { self[MyServiceKey.self] }
        set { self[MyServiceKey.self] = newValue }
    }
}
```

#### 2. Using the service type itself as the key

```swift
protocol AnotherService: Sendable {
    func performAction() -> String
}

struct DefaultAnotherService: AnotherService, DependencyKey {
    static let currentValue: AnotherService = DefaultAnotherService()
    
    func performAction() -> String {
        "Default implementation"
    }
}
```

### Using Dependencies

Once defined, you can access your dependencies in any type:

```swift
struct MyFeature {
    // Access using the keypath
    @Dependency(\.myService) var myService
    
    // Or directly with the type
    @Dependency(DefaultAnotherService.self) var anotherService
    
    func doWork() -> String {
        let result1 = myService.doSomething()
        let result2 = anotherService.performAction()
        return result1 + " " + result2
    }
}
```

### Overriding Dependencies

For testing or development purposes, you can override dependencies:

```swift
let myFeature = withDependencies {
    $0.myService = MockMyService()
    $0[DefaultAnotherService.self] = MockAnotherService()
} operation: {
    MyFeature()
}

// Now myFeature uses the mock implementations
```

## Testing Example

```swift
@Test
func featureWithMocks() {
    let feature = withDependencies {
        // Override dependencies with mocks
        $0.myService = MockMyService()
    } operation: {
        MyFeature()
    }
    
    // Now feature uses MockMyService instead of the default implementation
    #expect(feature.doWork() == "Mock implementation")
}
```

## Architecture

The library consists of a few key components:

- `DependencyKey`: A protocol defining how to register a dependency
- `DependencyValues`: A container for all registered dependencies
- `@Dependency`: A property wrapper for accessing dependencies
- `withDependencies`: A function for overriding dependencies in a specific scope

## License

MIT 
