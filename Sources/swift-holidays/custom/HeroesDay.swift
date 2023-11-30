//
//  HeroesDay.swift
//  
//
//  Created by Evan Anderson on 6/24/22.
//

import Foundation
import SwiftSovereignStates

enum HeroesDay : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "Heroes' Day"
    }
    
    public var aliases : Set<String>? {
        return ["National Heroes' Day"]
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .angola: return HolidayDate(year: year, month: .september, day: 17)
        case .barbados: return HolidayDate(year: year, month: .april, day: 28)
        case .bermuda: return HolidayDate.get_third(day_of_week: .monday, month: .june, year: year)
        case .cape_verde: return HolidayDate(year: year, month: .january, day: 20)
        case .timor_leste: return HolidayDate(year: year, month: .december, day: 31)
        case .hungary: return HolidayDate(year: year, month: .may, day: 31)
        case .indonesia: return HolidayDate(year: year, month: .november, day: 10)
        case .jamaica: return HolidayDate.get_third(day_of_week: .monday, month: .october, year: year)
        case .kenya: return HolidayDate(year: year, month: .october, day: 20)
        case .malaysia: return HolidayDate(year: year, month: .july, day: 31)
        case .mozambique: return HolidayDate(year: year, month: .february, day: 3)
        case .namibia: return HolidayDate(year: year, month: .august, day: 26)
        case .philippines: return HolidayDate.get_last(day_of_week: .monday, month: .august, year: year)
        case .rwanda: return HolidayDate(year: year, month: .february, day: 1)
        case .sri_lanka: return HolidayDate(year: year, month: .may, day: 22)
        case .uganda: return HolidayDate(year: year, month: .june, day: 9)
        case .united_kingdom: return HolidayDate(year: year, month: .october, day: 21)
        case .zimbabwe: return HolidayDate.get_second(day_of_week: .monday, month: .august, year: year)
        default: return nil
        }
    }
}
