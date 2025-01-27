//
//  WithDependencies.swift
//  
//
//  Created by Emil Marashliev on 27.01.25.
//

//private let dependencyObjects = DependencyObjects()
//
//private final class DependencyObjects: Sendable {
//  private let storage = LockIsolated<[ObjectIdentifier: DependencyObject]>([:])
//
//  internal init() {}
//
//  func store(_ object: AnyObject) {
//    let dependencyObject = DependencyObject(
//      object: object,
//      dependencyValues: DependencyValues.current
//    )
//    self.storage.withValue { [id = ObjectIdentifier(object)] storage in
//      storage[id] = dependencyObject
//      Task {
//        self.storage.withValue { storage in
//          for (id, object) in storage where object.isNil {
//            storage.removeValue(forKey: id)
//          }
//        }
//      }
//    }
//  }
//
//@discardableResult
//func withDependencies<R>(
//    _ updateValuesForOperation: (inout DependencyValues) throws -> Void,
//    operation: () throws -> R
//) rethrows -> R {
//    var dependencies = DependencyValues.current
//    try updateValuesForOperation(&dependencies)
//    return try DependencyValues.$current.withValue(dependencies) {
//        let result = try operation()
//        if R.self is AnyClass {
//            dependencyObjects.store(result as AnyObject)
//        }
//        return result
//    }
//}
