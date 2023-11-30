//
//  MayDay.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

enum MayDay : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "May Day"
    }
    
    public var aliases : Set<String>? {
        return ["Labour Day"]
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .bulgaria,
                .canada,
                .czech_republic,
                .estonia,
                .finland,
                .france,
                .germany,
                .greece,
                .ireland,
                .italy,
                .scotland:
            return HolidayDate(year: year, month: .may, day: 1)
        default:
            return nil
        }
    }
}
