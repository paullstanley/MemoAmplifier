//
//  EmailLandingPageViewModel.swift
//  Magpie
//
//  Created by Paull Stanley on 8/14/22.
//  Copyright © 2022 Paull Stanley. All rights reserved.
//

import Foundation

class EmailLandingPageViewModel: ObservableObject {
    @Published var engagementType: EngagementTypeUseCases? = .email
    
    func navigateTo(engagement type: EngagementTypeUseCases) {
        engagementType = type
    }
    
    private var emailMessageUseCases: [MessagesUseCaseModel] {
        
        API().allCurrentMessageUsesCases.filter ({ $0.key.hasPrefix("EMAIL_") })
        
    }
   
    var reasonsForAction: [MessagesUseCaseModel] {
        emailMessageUseCases.filter({ $0.key.hasPrefix("EMAIL_RFA") })
    }
    
    var nextStep: [MessagesUseCaseModel] {
        emailMessageUseCases.filter({ $0.key.hasPrefix("EMAIL_NS") })
    }
    
    var actionTaken: [MessagesUseCaseModel] {
        emailMessageUseCases.filter({ $0.key.hasPrefix("EMAIL_AT") })
    }
    
    var didAttemptToCall: [MessagesUseCaseModel] {
        emailMessageUseCases.filter({ $0.key.hasPrefix("EMAIL_AT_DC") })
    }
    
    var didNotAttemptToCall: [MessagesUseCaseModel] {
        emailMessageUseCases.filter({ $0.key.hasPrefix("EMAIL_AT_NC") })
    } 
}
