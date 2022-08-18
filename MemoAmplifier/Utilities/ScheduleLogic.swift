//
//  ScheduleLogic.swift
//  Magpie
//
//  Created by Paull Stanley on 8/15/22.
//  Copyright © 2022 Paull Stanley. All rights reserved.
//

import Foundation

struct ScheduleLogic {
    private var currentEmployeesSchedule: [String] {
        AppState.shared.selectedEmployeeForUseCase.schedule.components(separatedBy: " ")
    }
    private var todayAsInt: Int {
        let date = Date()
        let formatter  = DateFormatter()
        formatter.dateFormat = "EEEE"
        let dayOfTheWeekString = formatter.string(from: date)
        let myCalendar = Calendar(identifier: .gregorian)
        var weekDayInt = myCalendar.component(.weekday, from: formatter.date(from: dayOfTheWeekString)!)
        if weekDayInt == 7 {
            weekDayInt = 0
        }
        let weekDay = weekDayInt
        return weekDay
    }
    
    var nextScheduledDay: ScheduleDecoder {
        var nextDayWorking: ScheduleDecoder = .Unknown
        if(!currentEmployeesSchedule.isEmpty && currentEmployeesSchedule.count >= 7) {
            let previousDaysOfWeek =  currentEmployeesSchedule[0..<todayAsInt]
            let remainderOfWeek =
            currentEmployeesSchedule[todayAsInt + 1..<currentEmployeesSchedule.count]
            
            if (remainderOfWeek.first(where: { $0 != "-"}) != nil)   {
                nextDayWorking = ScheduleDecoder(rawValue: remainderOfWeek.first(where: { $0 != "-" }) ?? "Unknown")!
            } else if(remainderOfWeek.first(where: { $0 != "-"}) != nil) {
                nextDayWorking =  ScheduleDecoder(rawValue: previousDaysOfWeek.first(where: { $0 != "-"}) ?? "Unknown")!
            }
        }
        return nextDayWorking
    }
}

enum ScheduleDecoder: String {
    static let allCases = [Saturday, Sunday, Monday, Tuesday, Wednesday, Thursday, Friday]
    case Saturday = "Y"
    case Sunday = "S"
    case Monday = "M"
    case Tuesday = "T"
    case Wednesday = "W"
    case Thursday = "R"
    case Friday = "F"
    case Unknown = "Unknown"
    
}
