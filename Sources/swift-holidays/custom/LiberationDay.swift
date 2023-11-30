//
//  LiberationDay.swift
//  
//
//  Created by Evan Anderson on 6/24/22.
//

import Foundation
import SwiftSovereignStates

enum LiberationDay : String, CustomHoliday {
    case instance
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .albania: return HolidayDate(year: year, month: .november, day: 29)
        case .bulgaria,
                .united_states:
            return HolidayDate(year: year, month: .march, day: 3)
        case .democratic_republic_of_the_congo: return HolidayDate(year: year, month: .may, day: 17)
        case .cuba: return HolidayDate(year: year, month: .january, day: 1)
        case .czech_republic,
                .norway,
                .slovakia:
            return HolidayDate(year: year, month: .may, day: 8)
        case .denmark,
                .netherlands:
            return HolidayDate(year: year, month: .may, day: 5)
        case .falkland_islands: return HolidayDate(year: year, month: .june, day: 14)
        case .guernsey,
                .jersey:
            return HolidayDate(year: year, month: .may, day: 9)
        case .hungary: return HolidayDate(year: year, month: .april, day: 4)
        case .hong_kong: return HolidayDate.get_last(day_of_week: .monday, month: .august, year: year)
        case .india: return HolidayDate(year: year, month: .december, day: 19)
        case .italy: return HolidayDate(year: year, month: .april, day: 25)
        case .kuwait: return HolidayDate(year: year, month: .february, day: 26)
        case .lebanon: return HolidayDate(year: year, month: .may, day: 25)
        case .libya: return HolidayDate(year: year, month: .october, day: 23)
        case .north_macedonia: return HolidayDate(year: year, month: .october, day: 11)
        case .mali: return HolidayDate(year: year, month: .november, day: 19)
        case .moldova: return HolidayDate(year: year, month: .august, day: 24)
        case .nicaragua: return HolidayDate(year: year, month: .july, day: 19)
        case .north_korea,
                .south_korea:
            return HolidayDate(year: year, month: .august, day: 15)
        case .rwanda: return HolidayDate(year: year, month: .july, day: 4)
        case .togo: return HolidayDate(year: year, month: .january, day: 13)
        case .transnistria: return HolidayDate(year: year, month: .april, day: 12)
        case .uganda: return HolidayDate(year: year, month: .january, day: 26)
        case .ukraine: return HolidayDate(year: year, month: .october, day: 28)
        case .vietnam: return HolidayDate(year: year, month: .april, day: 30)
        default:
            return nil
        }
    }
}
