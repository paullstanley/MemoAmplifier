//
//  Globals.swift
//  MemoAmplifier
//
//  Created by Paull Stanley on 7/25/22.
//

import Foundation
import CodableCSV

struct GlobalConstants {
    //Directory of the current user's Home folder
    static let home = FileManager.default.homeDirectoryForCurrentUser.path
    //Directory of toolId.Csv
    static let toolIdFilePath = home + AppState.shared.REQUIRED_CSV_PATH
    
    static let databaseDirectory = home + "/Library/Application Support/MemoAmplifier/"
    
    static let sideBarItems = ["Callbacks", "Emails", "Messages", "Transfers"]
    
    static let sideBarIcons = ["phone.circle.fill", "envelope.circle.fill", "message.circle.fill", "briefcase.circle.fill"]
    
    static let doesDBDirectoryExist: Bool = {
        var isDir:ObjCBool = true
        if(!FileManager.default.fileExists(atPath: GlobalConstants.databaseDirectory, isDirectory: &isDir)) {
            return false
        }
        return true
    }()

    static let isToolIdUpToDate: Bool = {
        if FileManager.default.fileExists(atPath: GlobalConstants.toolIdFilePath) {
            let item = NSMetadataItem(url: URL(fileURLWithPath: GlobalConstants.toolIdFilePath))
            if AppState.shared.TOOL_ID_LAST_IMPORT_DATE != nil {
                if ((item?.value(forAttribute: "kMDItemContentModificationDate") as! Date) > AppState.shared.TOOL_ID_LAST_IMPORT_DATE!) {
                    return false
                } else if AppState.shared.TOOL_ID_LAST_IMPORT_DATE == nil {
                    return false
                }
            }
            return true
        }
        return true
    }()

    
    static let csvConfig = CSVDecoder {
        $0.headerStrategy = .none
        $0.bufferingStrategy = .sequential
        $0.trimStrategy = .whitespaces
        $0.encoding = .utf8
        $0.delimiters.row = "\n"
    }
    
    
    static let seasonalMessage: String = {
        var message = ""
        if(DateFormatter.currentMonth == "06") {
            message = EasterEggSnippets.celebratePride
        }
        if(DateFormatter.currentDate == "06/25") {
            message = EasterEggSnippets.wellWishesForTheCreator
        }
        if(DateFormatter.currentDate == "07/25") {
            message = EasterEggSnippets.canIGetAHappyBirthday
        }
        if(DateFormatter.currentDate == "01/01") {
            message = EasterEggSnippets.happyNewYear
        }
        if(DateFormatter.currentMonth == "12") {
            message = EasterEggSnippets.happyHolidays
        }
        return message
    }()
}
