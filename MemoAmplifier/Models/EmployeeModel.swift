//
//  EmployeeModel.swift
//  MemoAmplifier
//
//  Created by Paull Stanley on 8/17/22.
//

import Foundation

struct EmployeeModel {
    //Variables representing the columns from a source csv document that is used to populate the DB.
    let id: Int
    let name: String
    let emailAddress: String
    let slackURL: String
    let schedule: String
    let siteLocation: String
    let jobRole: String
}

extension EmployeeModel: Identifiable { }

extension EmployeeModel: Codable {
    private enum CodingKeys: Int, CodingKey
    {
        case id = 0
        case name = 1
        case emailAddress = 2
        case slackURL = 3
        case schedule = 4
        case siteLocation = 5
        case jobRole = 6
    }
}

