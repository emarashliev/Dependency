//
//  SomeView.swift
//
//
//  Created by Emil Marashliev on 27.01.25.
//

@testable import Dependency

// Actual usage
struct SomeView {
    @Dependency(\.myService1) var myService1
    @Dependency(MyService2.self) var myService2

    func performActionOnService1() -> String {
        myService1.doSomething()
    }

    func performActionOnService2() -> String {
        myService2.doSomething()
    }
}
