//
//  QueensBirthday.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

enum QueensBirthday : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "Queen's Official Birthday"
    }
    
    public var aliases : Set<String>? {
        return ["Queen's Birthday"]
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .anguilla,
                .australia,
                .cayman_islands,
                .cook_islands,
                .gibraltar,
                .montserrat,
                .papua_new_guinea,
                .saint_helena_ascension_and_tristan_da_cunha,
                .solomon_islands,
                .turks_and_caicos_islands:
            return HolidayDate.get_second(day_of_week: .monday, month: .june, year: year)
        case .falkland_islands: return HolidayDate(year: year, month: .april, day: 21)
        case .new_zealand: return HolidayDate.get_first(day_of_week: .monday, month: .june, year: year)
        case .tuvalu,
                .united_kingdom:
            return HolidayDate.get_second(day_of_week: .saturday, month: .june, year: year)
        default:
            return nil
        }
    }
}
