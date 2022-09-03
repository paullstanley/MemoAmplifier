//
//  NSManagedObject+Extensions.swift
//  MemoAmplifier
//
//  Created by Paull Stanley on 8/15/22.
//  Copyright © 2022 Paull Stanley. All rights reserved.
//

import Foundation
import CoreData


extension NSManagedObjectContext {
    func get<E, R>(request: NSFetchRequest<E>) async throws -> [R] where E: NSManagedObject, E: ToSafeObject, R == E.SafeType {
        try await self.perform { [weak self] in
            try self?.fetch(request).compactMap { try $0.safeObject() } ?? []
        }
    }
}

extension NSManagedObjectContext {
    func saveIfNeeded() {
     //   if hasChanges {
            do {
                try save()
            } catch {
                rollback()
            }
       // }
    }
}


enum SafeMapeError: Error {
    case invalidMapping
}

protocol ToSafeObject {
    associatedtype SafeType
    func safeObject() throws-> SafeType
}

