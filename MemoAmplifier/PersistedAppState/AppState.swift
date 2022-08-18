//
//  AppState.swift
//  MemoAmplifier
//
//  Created by Paull Stanley on 8/14/22.
//  Copyright © 2022 Paull Stanley. All rights reserved.
//

import Foundation

class AppState: ObservableObject {
    static let shared = AppState()
    let defaults = UserDefaults.standard
    
    private init() {
        REQUIRED_CSV_PATH = defaults.string(forKey: "REQUIRED_CSV_PATH") ?? ""
        IS_REQUIRED_CSV_FOUND = defaults.bool(forKey: "IS_REQUIRED_CSV_FOUND")
        IS_APP_ON_TOP = defaults.bool(forKey: "IS_APP_ON_TOP")
        USER_FIRST_NAME = defaults.string(forKey: "USER_FIRST_NAME") ?? ""
        USER_LAST_NAME = defaults.string(forKey: "USER_LAST_NAME") ?? ""
        TOOL_ID_LAST_IMPORT_DATE = defaults.object(forKey: "TOOL_ID_LAST_IMPORT_DATE") as? Date
        IS_FIRST_STARTUP = defaults.bool(forKey: "IS_FIRST_STARTUP")
    }
    
    var REQUIRED_CSV_PATH: String {
        didSet {
            defaults.set(REQUIRED_CSV_PATH, forKey: "REQUIRED_CSV_PATH")
        }
    }
    
    var IS_REQUIRED_CSV_FOUND: Bool {
        didSet {
            defaults.set(IS_REQUIRED_CSV_FOUND, forKey: "IS_REQUIRED_CSV_FOUND")
        }
    }
    
    var IS_APP_ON_TOP: Bool {
        didSet {
            defaults.set(IS_APP_ON_TOP, forKey: "IS_APP_ON_TOP")
        }
    }
    
    var USER_FIRST_NAME: String {
        didSet {
            defaults.set(USER_FIRST_NAME, forKey: "USER_FIRST_NAME")
        }
    }
    
    var USER_LAST_NAME: String {
        didSet {
            defaults.set(USER_LAST_NAME, forKey: "USER_LAST_NAME")
        }
    }
    
    @Published var TOOL_ID_LAST_IMPORT_DATE: Date? {
        didSet {
            defaults.set(TOOL_ID_LAST_IMPORT_DATE, forKey: "TOOL_ID_LAST_IMPORT_DATE")
        }
    }
    
    @Published var IS_FIRST_STARTUP: Bool? {
        didSet {
            defaults.set(IS_FIRST_STARTUP, forKey: "IS_FIRST_STARTUP")
        }
    }
    
    @Published var selectedMessageForUseCase = CurrentMessageUseCaseModel(reasonForAction: "", nextStep: "", actionTaken: "", caseNotes: "", caseNumber: "", appointmentDate: "", subjectLineForEmail: "")
    @Published var selectedEmployeeForUseCase = EmployeeModel(id: 0, name: "", emailAddress: "", slackURL: "", schedule: "", siteLocation: "", jobRole: "")
    
}
