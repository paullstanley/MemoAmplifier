//
//  MessageUseCaseMO+CoreDataProperties.swift
//  MemoAmplifier
//
//  Created by Paull Stanley on 8/17/22.
//
//

import Foundation
import CoreData


extension MessageUseCaseMO {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MessageUseCaseMO> {
        return NSFetchRequest<MessageUseCaseMO>(entityName: "MessageUseCaseEntity")
    }

    @NSManaged public var key: String
    @NSManaged public var value: String?
}

extension MessageUseCaseMO : Identifiable {
    public var id: String {
        self.key
    }
    
    public var userSelection: String {
        if key.contains(".") {
            return String(key.split(separator: ".")[1])
        }
        return ""
    }
}

extension MessageUseCaseMO {
    public var unwrappedValue: String {
        value ?? ""
    }
}

extension MessageUseCaseMO {
    func toDomainModel() -> MessagesUseCaseModel {
        return MessagesUseCaseModel(key: key, value: unwrappedValue)
    }
}

extension MessageUseCaseMO {
    static func findOrInsert(using key: String, and value: String, in context:NSManagedObjectContext)-> MessageUseCaseMO {
        let request = NSFetchRequest<MessageUseCaseMO>(entityName: "MessageUseCaseEntity")
        request.predicate = NSPredicate(format: "%K == %@", #keyPath(MessageUseCaseMO.key), key)
        request.fetchLimit = 1
        
        if let result = try? context.fetch(request),
           let message = result.first {
            return message
        }
        
        let message = MessageUseCaseMO(context: context)
        message.key = key
        message.value = value
        return message
    }
}

struct MessagesUseCaseModel {
    let key: String
    let value: String
}

extension MessagesUseCaseModel: Identifiable {
    public var id: String {
        key
    }
}

extension MessagesUseCaseModel {
    public var userSelection: String {
        String(key.split(separator: ".")[1])
    }
}
