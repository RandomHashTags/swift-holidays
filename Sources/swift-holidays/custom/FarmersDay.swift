//
//  FarmersDay.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

enum FarmersDay : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "Farmers' Day"
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .ghana: return HolidayDate.get_first(day_of_week: .friday, month: .december, year: year)
        case .india: return HolidayDate(year: year, month: .december, day: 23)
        case .pakistan: return HolidayDate(year: year, month: .december, day: 18)
        case .south_korea: return HolidayDate(year: year, month: .november, day: 11)
        case .united_states: return HolidayDate(year: year, month: .october, day: 12)
        case .zambia: return HolidayDate.get_first(day_of_week: .monday, month: .august, year: year)
        default: return nil
        }
    }
}
