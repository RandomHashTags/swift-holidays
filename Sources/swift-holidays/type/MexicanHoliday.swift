//
//  MexicanHoliday.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

public extension Holidays {
    enum Mexican : String, Holiday {
        case cinco_de_mayo
        case cry_of_dolores
        case day_of_the_army
        
        public var type : HolidayType {
            return .mexican
        }
        
        public var aliases : Set<String>? {
            return nil
        }
        
        public func get_date(country: Country?, year: Int) -> HolidayDate? {
            switch self {
            case .cinco_de_mayo: return HolidayDate(year: year, month: .may, day: 5)
            case .cry_of_dolores: return HolidayDate(year: year, month: .september, day: 16)
            default: return nil
            }
        }
    }
}
