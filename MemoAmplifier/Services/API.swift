//
//  API.swift
//  MemoAmplifier
//
//  Created by Paull Stanley on 8/17/22.
//

import SwiftUI

struct API {
    @ObservedObject var store = CoreDataServices.store
    @State var allCurrentMessageUsesCases: [MessagesUseCaseModel] = getAllMessageUseCases()
    @State var allCurrentEmployees: [EmployeeModel] = getAllEmployees()
 
    //TODO: HAVE IT FETCH ALL OF THE DB AND DO THE LOGIC LATER, THAT WAY I CAN STORE IT RATHER THAN CALL IT OVER AND OVER
    private static func getAllMessageUseCases()->[MessagesUseCaseModel]  {
        var fetchedMessageUseCases: [MessagesUseCaseModel] = []
        for i in 0..<CoreDataServices.store.savedMessageUseCases.count {
            fetchedMessageUseCases.append(CoreDataServices.store.savedMessageUseCases[i].toDomainModel())
        }
        return fetchedMessageUseCases
    }
    
    private static func getAllEmployees()-> [EmployeeModel] {
        var fetchedEmployees: [EmployeeModel] = []
        for i in 0..<CoreDataServices.store.savedEmployees.count {
            fetchedEmployees.append(CoreDataServices.store.savedEmployees[i].toDomainModel())
        }
        return fetchedEmployees
    }
    
    func getMessage(by key: String)-> [MessagesUseCaseModel] {
        return allCurrentMessageUsesCases.filter( { $0.key.hasPrefix("CB_\(key)") })
    }
}

