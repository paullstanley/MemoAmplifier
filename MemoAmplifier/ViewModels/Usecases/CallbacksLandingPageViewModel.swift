//
//  CallbacksLandingPageViewModel.swift
//  Magpie
//
//  Created by Paull Stanley on 8/14/22.
//  Copyright © 2022 Paull Stanley. All rights reserved.
//

import Foundation

class CallbacksLandingPageViewModel: ObservableObject {
    @Published var engagementType: EngagementTypeUseCases? = .callback
    
    func navigateTo(engagement type: EngagementTypeUseCases) {
        engagementType = type
    }
    
    var callbackMessageUseCases: [MessagesUseCaseModel]  {
             API().allCurrentMessageUsesCases.filter ({ $0.key.hasPrefix("CB_") })
    }
   
    var reasonsForAction: [MessagesUseCaseModel] {
        AppState.shared.selectedMessageForUseCase.subjectLineForEmail = "Callback Notification - Case "
        return callbackMessageUseCases.filter({ $0.key.hasPrefix("CB_RFA") })
    }
    
    var nextStep: [MessagesUseCaseModel] {
        callbackMessageUseCases.filter({ $0.key.hasPrefix("CB_NS") })
    }
    
    var actionTaken: [MessagesUseCaseModel] {
        callbackMessageUseCases.filter({ $0.key.hasPrefix("CB_AT") })
    }
    
    var didAttemptToCall: [MessagesUseCaseModel] {
        callbackMessageUseCases.filter({ $0.key.hasPrefix("CB_AT_DC") })
    }
    
    var didNotAttemptToCall: [MessagesUseCaseModel] {
        callbackMessageUseCases.filter({ $0.key.hasPrefix("CB_AT_NC") })
    }
    //ALWAYS TRUE WHEN PAGE LOADS-----FIX
    var doesToolIdExist: Bool?
}
