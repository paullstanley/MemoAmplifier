//
//  PreferencesMainViewModel.swift
//  Magpie
//
//  Created by Paull Stanley on 8/14/22.
//  Copyright © 2022 Paull Stanley. All rights reserved.
//

import Foundation

class PreferencesMainViewModel: ObservableObject {
    @Published var firstName = AppState.shared.USER_FIRST_NAME {
        didSet {
            AppState.shared.USER_FIRST_NAME = firstName
        }
    }
    
    @Published var lastName = AppState.shared.USER_LAST_NAME {
        didSet {
            AppState.shared.USER_LAST_NAME = lastName
        }
    }
    
    @Published var isOnTop: Bool = AppState.shared.IS_APP_ON_TOP {
        didSet {
            AppState.shared.IS_APP_ON_TOP = isOnTop
        }
    }
    
    
    func toggleWindowOnTop() {
        if AppState.shared.IS_APP_ON_TOP == true {
            AppState.shared.IS_APP_ON_TOP = false
        } else if AppState.shared.IS_APP_ON_TOP == false {
            AppState.shared.IS_APP_ON_TOP = true
        }
    }
}
