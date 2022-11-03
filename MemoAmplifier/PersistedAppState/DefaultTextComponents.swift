//
//  DefaultTextComponents.swift
//  MemoAmplifier
//
//  Created by Paull Stanley on 8/14/22.
//  Copyright © 2022 Paull Stanley. All rights reserved.
//

import Foundation

struct DefaultTextComponents {
    private static let reasonForActionWrapperText = "Reason for action:"
    private static let nextStepWrapperText = "YOUR NEXT STEP:"
    private static let actionTakenWrapperText = "Commitments Team action taken:"
    static let allMessageComponents: [String: String] = [
        //MARK: CALLBACK - REASON FOR ACTION
        "CB_RFA.Employee Unavailable": "\(reasonForActionWrapperText) Employee Unavailable",
        "CB_RFA.Not Completed": "\(reasonForActionWrapperText) Not marked complete",
        "CB_RFA.Overdue": "\(reasonForActionWrapperText) Overdue",
        "CB_RFA.Reminder": "\(reasonForActionWrapperText) Reminder",
        //MARK: CALLBACK - NEXT STEP
        "CB_NS.If Necessary": "\(nextStepWrapperText) Please review this case and reach out to the customer if necessary",
        "CB_NS.Mark Complete": "\(nextStepWrapperText) Please review this case and mark the engagement complete, rescheduled or cancelled in the Core Engagement Tracker",
        "CB_NS.Update Case Notes": "\(nextStepWrapperText) Please review this case, update Core notes and mark the engagement complete, rescheduled or cancelled",
        "CB_NS.Within 24 hrs/Next Shift": "\(nextStepWrapperText) Upon your return, please review this case and reach out to the customer within 24 hours or on your next scheduled shift",
        //MARK: CALLBACK - ACTION TAKEN - DID ATTEMPT CALL
        "CB_AT_DC.Unable to Contact": "\(actionTakenWrapperText) We attempted to reach out to the customer at the number listed in Core, but the call was not answered and we were unable to leave a voicemail",
        "CB_AT_DC.Transferred to Another T2": "\(actionTakenWrapperText) We have successfully reached out to your customer. As per customer request, we transferred the call to another Senior Employee to continue working on the case",
        "CB_AT_DC.New Issue": "\(actionTakenWrapperText) We have successfully reached out to the customer. The customer indicated that this a new issue. We transferred the call to the appropriate queue for assistance with the new issue",
        "CB_AT_DC.Left Voicemail": "\(actionTakenWrapperText)  We attempted to reach out to your customer at the number listed in Core, but were unable to get in touch. We left a voicemail stating that the owning employee is unavailable and provided support options if immediate assistance is needed",
        "CB_AT_DC.Customer Will Wait for Employee": "\(actionTakenWrapperText) We have successfully reached out to the customer. The customer stated they would like to continue to work with the owning employee on this case and will await follow up",
        "CB_AT_DC.Customer Will Call Back Later": "\(actionTakenWrapperText) We have successfully reached out to your customer. The customer will call back in to the main number and have the case re-escalated to another Senior Employee at a later time. The Commitments Team provided the customer with support options if immediate assistance is needed",
        "CB_AT_DC.Customer Resolved Issue": "\(actionTakenWrapperText) We have successfully reached out to your customer. The customer indicated that the issue is resolved and no further contact from us is needed",
        //MARK: CALLBACK - ACTION TAKEN - DID NOT  CALL
        "CB_AT_NC.Customer Called Back in": "\(actionTakenWrapperText) Customer Called Back in",
        "CB_AT_NC.Incorrect Contact Info": "\(actionTakenWrapperText) Incorrect Contact Info",
        "CB_AT_NC.Leftovers": "\(actionTakenWrapperText) Leftovers",
        "CB_AT_NC.No Number Listed": "\(actionTakenWrapperText) No Number Listed",
        "CB_AT_NC.Not Marked Complete":"\(actionTakenWrapperText) Not Marked Complete",
        "CB_AT_NC.Overdue": "\(actionTakenWrapperText) Overdue",
        "CB_AT_NC.RTA Follow-Up": "\(actionTakenWrapperText) RTA Follow-Up",
        "CB_AT_NC.Reassinged to a New T2": "\(actionTakenWrapperText) Reassinged to a New T2",
        "CB_AT_NC.Reminder": "\(actionTakenWrapperText) ",
        "CB_AT_NC.System Issues": "\(actionTakenWrapperText) System Issues",
        //MARK: EMAIL - NEXT STEP
        "EMAIL_NS.If Necessary": "\(nextStepWrapperText) Please review this case/email and reach out to the customer if necessary",
        "EMAIL_NS.Within 24 hrs/Next Shift": "\(nextStepWrapperText) Please review this case/email and reach out to the customer within 24 hours or on your next scheduled shift",
        //MARK: EMAIL - ACTION TAKEN - DID ATTEMPT CALL
        "EMAIL_AT_DC.Unable to Contact": "\(actionTakenWrapperText) We attempted to reach out to the customer at the number listed in Core, but the call was not answered and we were unable to leave a voicemail",
        "EMAIL_AT_DC.Transferred to Another T2": "\(actionTakenWrapperText) We have successfully reached out to your customer. As per customer request, we transferred the call to another Senior Employee to continue working on the case",
        "EMAIL_AT_DC.New Issue": "\(actionTakenWrapperText) We have successfully reached out to the customer. The customer indicated that this a new issue. We transferred the call to the appropriate queue for assistance with the new issue",
        "EMAIL_AT_DC.Left Voicemail": "\(actionTakenWrapperText) We attempted to reach out to your customer at the number listed in Core, but were unable to get in touch. We left a voicemail stating that the owning employee is unavailable and provided support options if immediate assistance is needed",
        "EMAIL_AT_DC.Customer Will Wait for Employee": "\(actionTakenWrapperText) We have successfully reached out to the customer. The customer stated they would like to continue to work with the owning employee on this case and will await follow up",
        "EMAIL_AT_DC.Customer Will Call Back Later": "\(actionTakenWrapperText) We have successfully reached out to your customer. The customer will call back in to the main number and have the case re-escalated to another Senior Employee at a later time. The Commitments Team provided the customer with support options if immediate assistance is needed",
        "EMAIL_AT_DC.Customer Resolved Issue": "\(actionTakenWrapperText) We have successfully reached out to your customer. The customer indicated that the issue is resolved and no further contact from us is needed",
        //MARK: EMAIL - ACTION TAKEN - DID NOT  CALL
        "EMAIL_AT_NC.Employee Available": "\(actionTakenWrapperText) None - awaiting employee response",
        "EMAIL_AT_NC.Customer Called Back in": "\(actionTakenWrapperText) We reviewed the case in Core and determined that no customer contact by the SPS Commitment Team was necessary. Customer has contacted us and continued the case with another Senior Employee.",
        "EMAIL_AT_NC.Emailed Customer": "\(actionTakenWrapperText) ",
        "EMAIL_AT_NC.Existing Actioned Commitment": "\(actionTakenWrapperText) We reviewed the email and determined that no customer contact by the SPS Commitments Team was necessary. The email left by the customer corresponds to a engagement on the same case, that was actioned by the SPS Commitments Team.",
        "EMAIL_AT_NC.Incorrect Contact Info": "\(actionTakenWrapperText) The info provided was incorrect",
        "EMAIL_AT.Not Marked Complete":"\(actionTakenWrapperText) ",
        //MARK: MESSAGE - REASON FOR ACTION
        "MESSAGE_RFA.Employee Unavailable": "\(reasonForActionWrapperText) Employee unavailable",
        "MESSAGE_RFA.Mark Complete": "\(reasonForActionWrapperText) Not marked complete",
        "MESSAGE_RFA.Overdue": "\(reasonForActionWrapperText) Customer message overdue",
        "MESSAGE_RFA.Role Change": "\(reasonForActionWrapperText) Employee job role changed",
        //MARK: MESSAGE - NEXT STEP
        "MESSAGE_NS.If Necessary": "\(nextStepWrapperText) Please review this case and reach out to the customer if necessary",
        "MESSAGE_NS.Immediately": "\(nextStepWrapperText) Please review this message and create a new commitment to call the customer as soon as possible, following CP401237",
        "MESSAGE_NS.Mark Complete": "\(nextStepWrapperText) Please review this case/engagement and mark the Customer Message engagement complete in the Core Engagement Tracker",
        "MESSAGE_NS.Within 24 hrs/Next Shift": "\(nextStepWrapperText) Upon your return, please review this case/engagement and reach out to the customer within 24 hours or on your next scheduled shift",
        //MARK: MESSAGE - ACTION TAKEN - DID ATTEMPT CALL
        "MESSAGE_AT_DC.Unable to Contact": "\(actionTakenWrapperText) We attempted to reach out to the customer at the number listed in Core, but the call was not answered and we were unable to leave a voicemail",
        "MESSAGE_AT_DC.Transferred to Another T2": "\(actionTakenWrapperText) We have successfully reached out to your customer. As per customer request, we transferred the call to another Senior Employee to continue working on the case",
        "MESSAGE_AT_DC.New Issue": "\(actionTakenWrapperText) We have successfully reached out to the customer. The customer indicated that this a new issue. We transferred the call to the appropriate queue for assistance with the new issue",
        "MESSAGE_AT_DC.Left Voicemail": "\(actionTakenWrapperText) We attempted to reach out to your customer at the number listed in Core, but were unable to get in touch. We left a voicemail stating that the owning employee is unavailable and provided support options if immediate assistance is needed",
        "MESSAGE_AT_DC.Customer Will Wait for Employee": "\(actionTakenWrapperText) We have successfully reached out to the customer. The customer stated they would like to continue to work with the owning employee on this case and will await follow up",
        "MESSAGE_AT_DC.Customer Will Call Back Later": "\(actionTakenWrapperText) We have successfully reached out to your customer. The customer will call back in to the main number and have the case re-escalated to another Senior Employee at a later time. The Commitments Team provided the customer with support options if immediate assistance is needed",
        "MESSAGE_AT_DC.Customer Resolved Issue": "\(actionTakenWrapperText) We have successfully reached out to your customer. The customer indicated that the issue is resolved and no further contact from us is needed",
        //MARK: MESSAGE - ACTION TAKEN - DID NOT  CALL
        "MESSAGE_AT_NC.Employee Available": "\(actionTakenWrapperText) Employee available",
        "MESSAGE_AT_NC.Customer Called Back in": "\(actionTakenWrapperText) The customer called back in",
        "MESSAGE_AT_NC.Existing Actioned Commitment": "\(actionTakenWrapperText) ",
        "MESSAGE_AT_NC.Insuffecient Information": "\(actionTakenWrapperText) There was insuffecient information which prevented us from actioning this message",
        "MESSAGE_AT_NC.No Immediate Follow-Up Needed": "\(actionTakenWrapperText) ",
        "MESSAGE_AT_NC.Not Marked Complete": "\(actionTakenWrapperText) Message not marked complete",
        "MESSAGE_AT_NC.Reminder": "\(actionTakenWrapperText) ",
        //MARK: TRANSFER - REASON FOR ACTION
        "TRANSFER_RFA.Audit": "This case was originally assigned to you",
        "TRANSFER_RFA.Case Transfer": "This is a Case Transfer Request",
        "TRANSFER_RFA.Final Audit": "This is the second audit of a case that was originally assigned to you. This case requires immediate action",
        "TRANSFER_RFA.Language Request": "This is a Language Request",
        "TRANSFER_RFA.RTA Fulfillment": "This is a an open RTA for another Services or Specialty Programs Support Tier 2 employee that is unable to continue working on the escalation with the customer",
        "TRANSFER_RFA.SSE Handoff": "This is an SSE handoff",
        //MARK: TRANSFER - CORE NOTES
        "TRANSFER_CN.Assigned": "We have assigned the case to",
        "TRANSFER_CN.Misclassified": "We have reassigned this request to the original employee",
        "TRANSFER_CN.Second Assignment": "We have reassigned the case to"
    ]
    
}

//MARK: EASTER EGG SNIPPETS
struct EasterEggSnippets {
    static let wellWishesForTheCreator: String = "On this day my creator was born. Happy Birthday, Paull!"
    static let canIGetAHappyBirthday: String = "AM I MALFUNCTIONING OR DOES TODAY MARK THE DATE OF YOUR BIRTH? BECAUSE I WAS INFORMED WE SHARE THE SAME DATE OF CREATION....please laugh"
    static let celebratePride: String = "Happy Pride month! 🏳️‍🌈"
    static let happyHolidays: String = "Happy Holidays! ☃️"
    static let happyNewYear: String = "Happy New Year! 🎊"
}
