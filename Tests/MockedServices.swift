//
//  MockedServices.swift
//
//
//  Created by Emil Marashliev on 27.01.25.
//

struct MockedMyService1: Service1 {
    func doSomething() -> String {
        "MockedMyService1"
    }
}

struct MockedMyService2: Service2 {
    func doSomething() -> String {
        "MockedMyService2"
    }
}
