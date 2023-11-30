//
//  BoxingDay.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

enum BoxingDay : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "Boxing Day"
    }
    
    public var aliases : Set<String>? {
        return ["Offering Day"]
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .australia,
                .anguilla,
                .bulgaria,
                .canada,
                .czech_republic,
                .fiji,
                .germany,
                .ireland,
                .jordan,
                .netherlands,
                .new_zealand,
                .poland,
                .romania,
                .scotland,
                .singapore,
                .slovakia,
                .south_africa,
                .trinidad_and_tobago:
            return HolidayDate(year: year, month: .december, day: 26)
        case .hong_kong,
                .malawi:
            let date1:HolidayDate = HolidayDate(year: year, month: .december, day: 26)
            let date:Date = date1.date
            guard let day_of_week:DayOfWeek = date.day_of_week else { return nil }
            switch day_of_week {
            case .saturday: return HolidayDate(date.addingTimeInterval(.days(2)))
            case .sunday: return HolidayDate(date.addingTimeInterval(.days(1)))
            default: return date1
            }
        case .nigeria:
            return HolidayDate(year: year, month: .december, day: 25).first_weekday_after
        case .united_kingdom:
            let date1:HolidayDate = HolidayDate(year: year, month: .december, day: 26)
            let date:Date = date1.date
            guard let day_of_week:DayOfWeek = date.day_of_week else { return nil }
            switch day_of_week {
            case .saturday,
                    .sunday:
                return HolidayDate(date.addingTimeInterval(.days(2)))
            default:
                return date1
            }
        default:
            return nil
        }
    }
}
