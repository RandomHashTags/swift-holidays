//
//  InternationalWorkersDay.swift
//  
//
//  Created by Evan Anderson on 6/24/22.
//

import Foundation
import SwiftSovereignStates

enum InternationalWorkersDay : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "International Workers' Day"
    }
    
    public var aliases : Set<String>? {
        return ["Labour Day", "May Day"]
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .germany,
                .sweden:
            return HolidayDate(year: year, month: .may, day: 1)
        default:
            return nil
        }
    }
}
