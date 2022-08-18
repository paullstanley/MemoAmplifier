//
//  HeaderViewModel.swift
//  Magpie
//
//  Created by Paull Stanley on 8/14/22.
//  Copyright © 2022 Paull Stanley. All rights reserved.
//

import Foundation

class HeaderViewModel: ObservableObject {
    private let listOfAllEmployees: [EmployeeModel] = API().allCurrentEmployees
    @Published var caseNumber: String = "" {
        didSet {
            if(!caseNumber.isEmpty) {
                AppState.shared.selectedMessageForUseCase.caseNumber = caseNumber
            }
        }
    }
    @Published var dateOfEngagement: String = "" {
        didSet {
            AppState.shared.selectedMessageForUseCase.appointmentDate = dateOfEngagement
        }
    }
    @Published var id = "" {
        didSet {
            if !listOfAllEmployees.isEmpty {
                let sanitizedToolId = sanitizeString(string: id)
                AppState.shared.selectedEmployeeForUseCase = listOfAllEmployees.first(where: { String($0.id) == sanitizedToolId }) ?? AppState.shared.selectedEmployeeForUseCase
            }
        }
    }
    
    private func sanitizeString(string: String)-> String {
        return string
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .filter("0123456789" .contains)
    }
}
