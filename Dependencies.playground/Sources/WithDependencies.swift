//
//  WithDependencies.swift
//
//
//  Created by Emil Marashliev on 27.01.25.
//

import Foundation

@discardableResult
public func withDependencies<R>(
    _ updateValuesForOperation: (inout DependencyValues) throws -> Void,
    operation: () throws -> R
) rethrows -> R {
    var dependencies = DependencyValues.current
    try updateValuesForOperation(&dependencies)
    return try DependencyValues.$current.withValue(dependencies) {
        try operation()
    }
}
