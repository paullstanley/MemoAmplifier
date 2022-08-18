//
//  SendMail.swift
//  Magpie
//
//  Created by Paull Stanley on 7/27/22.

import Cocoa
//Service in charge of generating an email
class MessageSender: NSObject {
    static func sendEmail(to employee: EmployeeModel, with currentMessageUseCase: CurrentMessageUseCaseModel) {
        let service = NSSharingService(named: NSSharingService.Name.composeEmail)!
        service.recipients = [employee.emailAddress]
        
        service.subject = "\(currentMessageUseCase.subjectLineForEmail)\(currentMessageUseCase.caseNumber)"
        service.perform(withItems: ["""
        Services & SPS Commitments Team
        
        Hello \(employee.name),
        
        The SPS Commitments Team reviewed an engagement on your behalf.
        
        \(currentMessageUseCase.reasonForAction)
        
        CASE NUMBER: \(currentMessageUseCase.caseNumber)
        SCHEDULED TIME: \(currentMessageUseCase.appointmentDate)
        
        \(currentMessageUseCase.actionTaken)
        
        \(currentMessageUseCase.nextStep)
        
        Thank you,
        \(AppState.shared.USER_FIRST_NAME) \(AppState.shared.USER_LAST_NAME)
        SPS Commitments Team
        
        APPLE INTERNAL USE ONLY.
        
        Check out our Gather page: https://gather.corp.apple.com/community/sps/sps-commitments
        
        """])
    }
    
    static func sendSlack(to urlString: String?) {
        if let urlString = urlString  {
            if let url = URL(string: urlString) {
                NSWorkspace.shared.open(url)
            }
        }
    }
    
    static func openCoreCase(for urlString: String?) {
       
        if let urlString = urlString  {
            if let url = URL(string: urlString) {
                NSWorkspace.shared.open(url)
            }
        }
    }
}

