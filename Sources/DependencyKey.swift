//
//  DependencyKey.swift
//
//
//  Created by Emil Marashliev on 27.01.25.
//

public protocol DependencyKey<Value> {
    associatedtype Value: Sendable = Self
    static var currentValue: Value { get }
}
