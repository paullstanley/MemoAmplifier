//
//  FooterViewModel.swift
//  Magpie
//
//  Created by Paull Stanley on 8/14/22.
//  Copyright © 2022 Paull Stanley. All rights reserved.
//

import Foundation

class FooterViewModel: ObservableObject {
    private let  listOfAllEmployees = API().allCurrentEmployees
    func sendSlackMessage() {
        if  AppState.shared.selectedEmployeeForUseCase.slackURL != "" {
            MessageSender.sendSlack(to: AppState.shared.selectedEmployeeForUseCase.slackURL)
        }
    }
    
    func sendEmail() {
        if (listOfAllEmployees.contains(where: { $0.name == AppState.shared.selectedEmployeeForUseCase.name })) {
            MessageSender.sendEmail(to: AppState.shared.selectedEmployeeForUseCase, with: AppState.shared.selectedMessageForUseCase)
        }
    }
    
    func openCaseInCore() {
        let caseNumber: String?  = "ilog://caseId=\(AppState.shared.selectedMessageForUseCase.caseNumber)"
        MessageSender.openCoreCase(for: caseNumber)
    }
}
