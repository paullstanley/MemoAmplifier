//
//  Date+Extensions.swift
//  MemoAmplifier
//
//  Created by Paull Stanley on 7/25/22.
//

import Foundation

//Extension to the DateFormatter clas that allows me to easily format dates to the expected date format of the ToolId.csv
extension DateFormatter {
    static let csvDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale  = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd h:mm a"
        return formatter
    }()
    
    static let currentDate: String = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
        return formatter.string(from: Date() as Date)
    }()
    
    static let currentMonth: String = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM"
        return formatter.string(from: Date() as Date)
    }()
}
