//
//  CurrentMessageComponentsModel.swift
//  MemoAmplifier
//
//  Created by Paull Stanley on 8/12/22.
//  Copyright © 2022 Paull Stanley. All rights reserved.
//

import Foundation

struct CurrentMessageUseCaseModel {
    let id: String = "1"
    var reasonForAction: String
    var nextStep: String
    var actionTaken: String
    var caseNotes: String
    var caseNumber: String
    var appointmentDate: String
    var subjectLineForEmail: String
}

extension CurrentMessageUseCaseModel: Equatable { }

extension CurrentMessageUseCaseModel: Identifiable { }

