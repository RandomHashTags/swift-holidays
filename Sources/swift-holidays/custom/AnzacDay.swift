//
//  AnzacDay.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

// https://en.wikipedia.org/wiki/Anzac_Day
enum AnzacDay : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "Anzac Day"
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .australia,
                .cook_islands,
                .new_zealand,
                .niue,
                .norfolk_island,
                .tokelau,
                .tonga:
            return HolidayDate(year: year, month: .april, day: 25)
        default:
            return nil
        }
    }
}
