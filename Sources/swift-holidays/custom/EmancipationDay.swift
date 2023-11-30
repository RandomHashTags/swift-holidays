//
//  EmancipationDay.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

enum EmancipationDay : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "Emancipation Day"
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .antigua_and_barbuda,
                .anguilla,
                .bahamas,
                .barbados,
                .belize,
                .bermuda,
                .british_virgin_islands,
                .canada,
                .dominica,
                .grenada,
                .jamaica,
                .saint_kitts_and_nevis,
                .saint_vincent_and_the_grenadines,
                .south_africa,
                .trinidad_and_tobago:
            return HolidayDate(year: year, month: .july, day: 31)
        case .guadeloupe:
            return HolidayDate(year: year, month: .may, day: 27)
        case .puerto_rico:
            return HolidayDate(year: year, month: .march, day: 22)
        case .suriname:
            return HolidayDate(year: year, month: .july, day: 1)
        default:
            return nil
        }
    }
}
