//
//  MartyrsDay.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

enum MartyrsDay : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "Martyrs' Day"
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .afghanistan: return HolidayDate(year: year, month: .september, day: 8)
        case .armenia: return HolidayDate(year: year, month: .april, day: 24)
        case .azerbaijan: return HolidayDate(year: year, month: .january, day: 20)
        case .burkina_faso: return HolidayDate(year: year, month: .october, day: 31)
        case .china: return HolidayDate(year: year, month: .september, day: 30)
        case .eritrea: return HolidayDate(year: year, month: .june, day: 20)
        case .india: return HolidayDate(year: year, month: .january, day: 30)
        case .lebanon,
                .syria:
            return HolidayDate(year: year, month: .may, day: 6)
        case .libya: return HolidayDate(year: year, month: .september, day: 16)
        case .madagascar: return HolidayDate(year: year, month: .march, day: 29)
        case .malawi: return HolidayDate(year: year, month: .march, day: 3)
        case .myanmar: return HolidayDate(year: year, month: .july, day: 19)
        case .pakistan: return HolidayDate(year: year, month: .april, day: 30)
        case .panama: return HolidayDate(year: year, month: .january, day: 9)
        case .sao_tome_and_principe: return HolidayDate(year: year, month: .february, day: 3)
        case .south_sudan: return HolidayDate(year: year, month: .july, day: 30)
        case .togo: return HolidayDate(year: year, month: .june, day: 21)
        case .tunisia: return HolidayDate(year: year, month: .april, day: 9)
        case .turkey: return HolidayDate(year: year, month: .march, day: 18)
        case .vietnam: return HolidayDate(year: year, month: .july, day: 27)
        case .uganda: return HolidayDate(year: year, month: .june, day: 3)
        case .united_arab_emirates: return HolidayDate(year: year, month: .november, day: 30)
        default: return nil
        }
    }
}
