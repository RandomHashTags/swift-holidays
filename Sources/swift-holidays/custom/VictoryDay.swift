//
//  VictoryDay.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

enum VictoryDay : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "Victory Day"
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .afghanistan: return HolidayDate(year: year, month: .april, day: 28)
        case .azerbaijan: return HolidayDate(year: year, month: .november, day: 8)
        case .bangladesh: return HolidayDate(year: year, month: .december, day: 16)
        case .belarus,
                .kazakhstan,
                .moldova,
                .russia,
                .sri_lanka,
                .transnistria,
                .ukraine:
            return HolidayDate(year: year, month: .may, day: 9)
        case .cambodia: return HolidayDate(year: year, month: .january, day: 7)
        case .estonia: return HolidayDate(year: year, month: .june, day: 23)
        case .poland: return HolidayDate(year: year, month: .may, day: 8)
        case .turkey: return HolidayDate(year: year, month: .august, day: 30)
        case .vietnam: return HolidayDate(year: year, month: .april, day: 30)
        default: return nil
        }
    }
}
