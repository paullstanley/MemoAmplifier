//
//  MessagessLandingPageViewModel.swift
//  Magpie
//
//  Created by Paull Stanley on 8/14/22.
//  Copyright © 2022 Paull Stanley. All rights reserved.
//

import Foundation

class MessagessLandingPageViewModel: ObservableObject {
    @Published var engagementType: EngagementTypeUseCases? = .message
    
    func navigateTo(engagement type: EngagementTypeUseCases) {
        engagementType = type
    }
    
    private let messageMessageUseCases: [MessagesUseCaseModel] = API().allCurrentMessageUsesCases.filter ({ $0.key.hasPrefix("MESSAGE_") })
   
    var reasonsForAction: [MessagesUseCaseModel] {
        messageMessageUseCases.filter({ $0.key.hasPrefix("MESSAGE_RFA") })
    }
    
    var nextStep: [MessagesUseCaseModel] {
        messageMessageUseCases.filter({ $0.key.hasPrefix("MESSAGE_NS") })
    }
    
    var actionTaken: [MessagesUseCaseModel] {
        messageMessageUseCases.filter({ $0.key.hasPrefix("MESSAGE_AT") })
    }
    
    var didAttemptToCall: [MessagesUseCaseModel] {
        messageMessageUseCases.filter({ $0.key.hasPrefix("MESSAGE_AT_DC") })
    }
    
    var didNotAttemptToCall: [MessagesUseCaseModel] {
        messageMessageUseCases.filter({ $0.key.hasPrefix("MESSAGE_AT_NC") })
    }
}
