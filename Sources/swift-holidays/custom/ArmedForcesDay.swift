//
//  ArmedForcesDay.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

// https://en.wikipedia.org/wiki/Armed_Forces_Day
enum ArmedForcesDay : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "Armed Forces Day"
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .australia,
                .cook_islands,
                .new_zealand,
                .tonga:
            return HolidayDate(year: year, month: .april, day: 25)
        case .azerbaijan: return HolidayDate(year: year, month: .june, day: 26)
        case .armenia: return HolidayDate(year: year, month: .january, day: 28)
        case .bangladesh,
                .greece:
            return HolidayDate(year: year, month: .november, day: 21)
        case .bolivia: return HolidayDate(year: year, month: .august, day: 7)
        case .bulgaria: return HolidayDate(year: year, month: .may, day: 6)
        case .canada: return HolidayDate.get_first(day_of_week: .sunday, month: .june, year: year)
        case .chile: return HolidayDate(year: year, month: .september, day: 19)
        case .china,
                .lebanon:
            return HolidayDate(year: year, month: .august, day: 1)
        case .croatia: return HolidayDate(year: year, month: .may, day: 28)
        case .cuba: return HolidayDate(year: year, month: .december, day: 2)
        case .dominican_republic: return HolidayDate(year: year, month: .february, day: 25)
        case .egypt: return HolidayDate(year: year, month: .october, day: 6)
        case .finland: return HolidayDate(year: year, month: .june, day: 4)
        case .georgia: return HolidayDate(year: year, month: .april, day: 30)
        case .guatemala: return HolidayDate(year: year, month: .june, day: 30)
        case .haiti: return HolidayDate(year: year, month: .november, day: 18)
        case .hungary: return HolidayDate(year: year, month: .may, day: 21)
        case .india,
                .nigeria:
            return HolidayDate(year: year, month: .january, day: 15)
        case .indonesia: return HolidayDate(year: year, month: .october, day: 5)
        case .iran: return HolidayDate(year: year, month: .april, day: 18)
        case .iraq: return HolidayDate(year: year, month: .january, day: 6)
        case .italy: return HolidayDate(year: year, month: .november, day: 4)
        case .kazakhstan: return HolidayDate(year: year, month: .may, day: 7)
        case .laos: return HolidayDate(year: year, month: .january, day: 20)
        case .latvia: return HolidayDate(year: year, month: .july, day: 10)
        case .liberia: return HolidayDate(year: year, month: .february, day: 11)
        case .lithuania: return HolidayDate(year: year, month: .november, day: 23)
        case .malaysia: return HolidayDate(year: year, month: .september, day: 16)
        case .maldives: return HolidayDate(year: year, month: .april, day: 21)
        case .mali: return HolidayDate(year: year, month: .january, day: 20)
        case .mexico: return HolidayDate(year: year, month: .february, day: 19)
        case .mongolia: return HolidayDate(year: year, month: .march, day: 18)
        case .myanmar: return HolidayDate(year: year, month: .march, day: 27)
        case .north_korea: return HolidayDate(year: year, month: .february, day: 8)
        case .north_macedonia: return HolidayDate(year: year, month: .august, day: 18)
        case .pakistan: return HolidayDate(year: year, month: .september, day: 6)
        case .peru: return HolidayDate(year: year, month: .september, day: 24)
        case .philippines: return HolidayDate(year: year, month: .december, day: 21)
        case .poland: return HolidayDate(year: year, month: .august, day: 15)
        case .romania: return HolidayDate(year: year, month: .october, day: 25)
        case .russia: return HolidayDate(year: year, month: .february, day: 23)
        case .serbia: return HolidayDate(year: year, month: .april, day: 23)
        case .singapore: return HolidayDate(year: year, month: .july, day: 1)
        case .south_africa: return HolidayDate(year: year, month: .february, day: 21)
        case .south_korea: return HolidayDate(year: year, month: .october, day: 1)
        case .taiwan: return HolidayDate(year: year, month: .september, day: 3)
        case .tajikistan: return HolidayDate(year: year, month: .february, day: 23)
        case .thailand: return HolidayDate(year: year, month: .january, day: 18)
        case .transnistria: return HolidayDate(year: year, month: .september, day: 6)
        case .ukraine: return HolidayDate(year: year, month: .december, day: 6)
        case .united_kingdom: return HolidayDate.get_last(day_of_week: .saturday, month: .june, year: year)
        case .united_states: return HolidayDate.get_third(day_of_week: .sunday, month: .may, year: year)
        case .venezuela: return HolidayDate(year: year, month: .june, day: year)
        case .vietnam: return HolidayDate(year: year, month: .december, day: 22)
        default: return nil
        }
    }
}
