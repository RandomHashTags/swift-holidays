//
//  AfricaDay.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

// https://en.wikipedia.org/wiki/Africa_Day
enum AfricaDay : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "Africa Day"
    }
    
    public var aliases : Set<String>? {
        return ["African Freedom Day", "African Liberation Day"]
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .mauritania,
                .south_africa:
            return HolidayDate(year: year, month: .may, day: 25)
        default:
            return nil
        }
    }
}
