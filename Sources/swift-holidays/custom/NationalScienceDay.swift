//
//  NationalScienceDay.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

enum NationalScienceDay : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "National Science Day"
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .india: return HolidayDate(year: year, month: .february, day: 28)
        default: return nil
        }
    }
}
