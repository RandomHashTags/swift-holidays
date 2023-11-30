//
//  NationalDonutDay.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

enum NationalDonutDay : String, CustomHoliday {
    case instance
    
    public var aliases : Set<String>? {
        return ["National Doughnut Day"]
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .australia: return HolidayDate(year: year, month: .october, day: 25)
        case .united_states: return HolidayDate.get_first(day_of_week: .friday, month: .june, year: year)
        default: return nil
        }
    }
}
