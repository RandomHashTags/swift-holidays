//
//  RepublicDay.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

enum RepublicDay : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "Republic Day"
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .switzerland: return HolidayDate(year: year, month: .march, day: 1)
        default: return nil
        }
    }
}
