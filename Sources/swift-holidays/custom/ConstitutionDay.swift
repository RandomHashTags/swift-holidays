//
//  ConstitutionDay.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

enum ConstitutionDay : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "Constitution Day"
    }
    
    public var aliases : Set<String>? {
        return ["Citizenship Day"]
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .abkhazia: return HolidayDate(year: year, month: .november, day: 26)
        case .andorra: return HolidayDate(year: year, month: .march, day: 14)
        case .argentina,
                .latvia,
                .marshall_islands:
            return HolidayDate(year: year, month: .may, day: 1)
        case .armenia: return HolidayDate(year: year, month: .july, day: 5)
        case .australia,
                .palau:
            return HolidayDate(year: year, month: .july, day: 9)
        case .azerbaijan: return HolidayDate(year: year, month: .november, day: 12)
        case .belarus: return HolidayDate(year: year, month: .march, day: 15)
        case .belgium: return HolidayDate(year: year, month: .july, day: 21)
        case .brazil: return HolidayDate(year: year, month: .november, day: 15)
        case .cambodia: return HolidayDate(year: year, month: .september, day: 24)
        case .canada: return HolidayDate(year: year, month: .july, day: 1)
        case .china: return HolidayDate(year: year, month: .december, day: 4)
        case .cook_islands: return HolidayDate(year: year, month: .august, day: 4)
        case .denmark: return HolidayDate(year: year, month: .june, day: 5)
        case .dominican_republic: return HolidayDate(year: year, month: .november, day: 6)
        case .ethiopia: return HolidayDate(year: year, month: .july, day: 16)
        case .fiji: return HolidayDate(year: year, month: .september, day: 7)
        case .finland: return HolidayDate(year: year, month: .july, day: 17)
        case .germany: return HolidayDate(year: year, month: .may, day: 23)
        case .ghana: return HolidayDate(year: year, month: .january, day: 7)
        case .india: return HolidayDate(year: year, month: .january, day: 26)
        case .indonesia: return HolidayDate(year: year, month: .august, day: 17)
        case .ireland: return HolidayDate(year: year, month: .december, day: 29)
        case .italy: return HolidayDate(year: year, month: .january, day: 1)
        case .japan,
                .poland:
            return HolidayDate(year: year, month: .may, day: 3)
        case .kazakhstan: return HolidayDate(year: year, month: .august, day: 30)
        case .kyrgyzstan: return HolidayDate(year: year, month: .may, day: 5)
        case .lithuania: return HolidayDate(year: year, month: .october, day: 25)
        case .maldives: return HolidayDate(year: year, month: .december, day: 22)
        case .mexico: return HolidayDate.get_first(day_of_week: .monday, month: .february, year: year)
        case .mongolia: return HolidayDate(year: year, month: .january, day: 13)
        case .netherlands:
            let date:HolidayDate = HolidayDate(year: year, month: .december, day: 15)
            return date.date.day_of_week == .sunday ? date.plus(.days(1)) : date
        case .micronesia: return HolidayDate(year: year, month: .may, day: 10)
        case .north_korea: return HolidayDate(year: year, month: .december, day: 27)
        case .norway: return HolidayDate(year: year, month: .may, day: 17)
        case .pakistan: return HolidayDate(year: year, month: .march, day: 23)
        case .philippines: return HolidayDate(year: year, month: .february, day: 2)
        case .puerto_rico: return HolidayDate(year: year, month: .july, day: 25)
        case .romania,
                .uzbekistan:
            return HolidayDate(year: year, month: .december, day: 8)
        case .russia: return HolidayDate(year: year, month: .december, day: 12)
        case .serbia: return HolidayDate(year: year, month: .february, day: 15)
        case .slovakia: return HolidayDate(year: year, month: .september, day: 1)
        case .south_korea: return HolidayDate(year: year, month: .july, day: 17)
        case .spain: return HolidayDate(year: year, month: .december, day: 6)
        case .sweden: return HolidayDate(year: year, month: .july, day: 6)
        case .switzerland: return HolidayDate(year: year, month: .september, day: 12)
        case .taiwan: return HolidayDate(year: year, month: .december, day: 25)
        case .tajikistan: return HolidayDate(year: year, month: .november, day: 6)
        case .thailand: return HolidayDate(year: year, month: .december, day: 10)
        case .transnistria: return HolidayDate(year: year, month: .december, day: 24)
        case .turkmenistan: return HolidayDate(year: year, month: .may, day: 18)
        case .ukraine: return HolidayDate(year: year, month: .june, day: 28)
        case .united_states: return HolidayDate(year: year, month: .september, day: 17)
        case .uruguay: return HolidayDate(year: year, month: .july, day: 18)
        case .vanuatu: return HolidayDate(year: year, month: .october, day: 5)
        default: return nil
        }
    }
}
