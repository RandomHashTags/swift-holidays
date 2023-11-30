//
//  Thanksgiving.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

enum Thanksgiving : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "Thanksgiving"
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .canada: return HolidayDate.get_first(day_of_week: .monday, month: .october, year: year)
        case .brazil,
                .philippines,
                .netherlands,
                .united_states:
            return HolidayDate.get_last(day_of_week: .thursday, month: .november, year: year)
        case .germany: return HolidayDate.get_first(day_of_week: .sunday, month: .october, year: year)
        case .japan: return HolidayDate(year: year, month: .november, day: 23)
        case .liberia: return HolidayDate.get_first(day_of_week: .thursday, month: .november, year: year)
        case .rwanda: return HolidayDate.get_first(day_of_week: .friday, month: .august, year: year)
        default: return nil
        }
    }
}
