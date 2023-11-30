//
//  AustralianHoliday.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

public extension Holidays {
    enum Australian : String, Holiday {
        case australia_day
        case western_australia_day
        
        public var type : HolidayType {
            return .australian
        }
        
        public var aliases : Set<String>? {
            switch self {
            case .australia_day: return ["ANA Day", "Anniversary Day", "Foundation Day", "Invasion Day", "Survival Day", "Day of Mourning"]
            case .western_australia_day: return ["Foundation Day", "WA Day"]
            }
        }
        
        public func get_date(country: Country?, year: Int) -> HolidayDate? {
            switch self {
            case .australia_day: return HolidayDate(year: year, month: .january, day: 26)
            case .western_australia_day: return HolidayDate.get_first(day_of_week: .monday, month: .june, year: year)
            }
        }
    }
}
