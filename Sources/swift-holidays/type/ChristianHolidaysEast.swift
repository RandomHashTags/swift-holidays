//
//  ChristianHolidaysEast.swift
//  
//
//  Created by Evan Anderson on 7/1/22.
//

import Foundation

public extension Holidays {
    enum ChristianEast : String, ChristianHoliday {
        case all_saints_day
        case all_souls_day
        case ash_wednesday
        case assumption_of_mary
        case christmas
        case christmas_eve
        case easter
        case easter_monday
        case epiphany
        case feast_of_the_ascension
        case good_friday
        case halloween
        case holy_saturday
        case holy_tuesday
        case immaculate_conception
        case mardi_gras
        case palm_sunday
        case pentecost
        case saint_josephs_day
        case saint_patricks_day
        case valentines_day
        case whit_monday
        
        public var type : HolidayType {
            return .christian_east
        }
        public func isWestern() -> Bool {
            return false
        }
    }
}
