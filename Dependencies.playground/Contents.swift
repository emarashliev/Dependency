import Foundation

// Example 1
struct MyService {
    func doSomething() {
        print("Doing something... 1")
    }
}

struct MyServiceKey: DependencyKey {
    static let currentValue = MyService()
}

extension DependencyValues {
    var myService: MyService {
        get { self[MyServiceKey.self] }
        set { self[MyServiceKey.self] = newValue }
    }
}

// Example 2
struct MyService2 {
    func doSomething() {
        print("Doing something... 2")
    }
}

extension MyService2: DependencyKey {
    static let currentValue = Self()
}

//
struct ContentView {
    @Dependency(\.myService) var myService
    @Dependency(MyService2.self) var myService2

    func performAction() {
        myService.doSomething()
        myService2.doSomething()
    }
}

let contentView = ContentView()
contentView.performAction()
