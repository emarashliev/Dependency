//
//  DependencyTests.swift
//
//
//  Created by Emil Marashliev on 27.01.25.
//

import Testing
@testable import Dependency

struct DependencyTests {

    @Test
    func normalCall() async throws {
        let someView = SomeView()
        #expect(someView.performActionOnService1() == "A string from MyService1")
        #expect(someView.performActionOnService2() == "A string from MyService2")
    }

    @Test
    func callOnMockedService() async throws {
        let someView = SomeView()
        let someViewWithMockedDependencies = withDependencies {
            $0.myService1 = MockedMyService1()
            $0[MyService2.self] = MockedMyService2()
        } operation: {
            SomeView()
        }

        #expect(someViewWithMockedDependencies.performActionOnService1() == "MockedMyService1")
        #expect(someViewWithMockedDependencies.performActionOnService2() == "MockedMyService2")

        #expect(someView.performActionOnService1() == "A string from MyService1")
        #expect(someView.performActionOnService2() == "A string from MyService2")
    }
}
