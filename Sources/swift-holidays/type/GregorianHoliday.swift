//
//  GregorianHoliday.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

public extension Holidays {
    enum Gregorian : String, Holiday {
        case new_years_day
        case new_years_eve
        
        public var type : HolidayType {
            return .gregorian
        }
        
        public var aliases : Set<String>? {
            return nil
        }
        
        public var wikipedia_name : String? {
            switch self {
            case .new_years_day: return "New Year's Day"
            case .new_years_eve: return "New Year's Eve"
            }
        }
        
        public func get_date(country: Country?, year: Int) -> HolidayDate? {
            switch self {
            case .new_years_day: return HolidayDate(year: year, month: .january, day: 1)
            case .new_years_eve: return HolidayDate(year: year, month: .december, day: 31)
            }
        }
    }
}
