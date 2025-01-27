//
//  DependencyKey.swift
//  
//
//  Created by Emil Marashliev on 27.01.25.
//

import Foundation

public protocol DependencyKey<Value> {
    associatedtype Value: Sendable = Self
    static var currentValue: Value { get }
}

extension DependencyKey {
    public static var currentValue: Value {
        fatalError("No current value provided for \(Self.self)")
    }
}
