//
//  TransfersLandingPageViewModel.swift
//  Magpie
//
//  Created by Paull Stanley on 8/14/22.
//  Copyright © 2022 Paull Stanley. All rights reserved.
//

import Foundation

class TransfersLandingPageViewModel: ObservableObject {
    
    @Published var engagementType: EngagementTypeUseCases? = .transfer
    
    func navigateTo(engagement type: EngagementTypeUseCases) {
        engagementType = type
    }
    
    private var transferMessageUseCases: [MessagesUseCaseModel]  {
        API().allCurrentMessageUsesCases.filter ({ $0.key.hasPrefix("TRANSFER_")})
    }
   
    var reasonsForAction: [MessagesUseCaseModel] {
        transferMessageUseCases.filter({ $0.key.hasPrefix("TRANSFER_RFA") })
    }
    
    var nextStep: [MessagesUseCaseModel] {
        transferMessageUseCases.filter({ $0.key.hasPrefix("TRANSFER_NS") })
    }
    
    var actionTaken: [MessagesUseCaseModel] {
        transferMessageUseCases.filter({ $0.key.hasPrefix("TRANSFER_AT") })
    }
    
    var didAttemptToCall: [MessagesUseCaseModel] {
        transferMessageUseCases.filter({ $0.key.hasPrefix("TRANSFER_AT_DC") })
    }
    
    var didNotAttemptToCall: [MessagesUseCaseModel] {
        transferMessageUseCases.filter({ $0.key.hasPrefix("TRANSFER_AT_NC") })
    }
}
