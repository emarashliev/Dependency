//
//  Services.swift
//
//
//  Created by Emil Marashliev on 27.01.25.
//

import Foundation
@testable import Dependency

protocol Service1: Sendable {
    func doSomething() -> String
}

protocol Service2: Sendable {
    func doSomething() -> String
}

// Example 1
struct MyService1: Service1 {
    func doSomething() -> String {
        "A string from MyService1"
    }
}

struct MyServiceKey: DependencyKey {
    static let currentValue: Service1 =  MyService1()
}

extension DependencyValues {
    var myService1: Service1 {
        get { self[MyServiceKey.self] }
        set { self[MyServiceKey.self] = newValue }
    }
}

// Example 2
struct MyService2: Service2 {
    func doSomething() -> String {
        "A string from MyService2"
    }
}

extension MyService2: DependencyKey {
    static let currentValue: Service2 = Self()
}
