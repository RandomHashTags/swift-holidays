//
//  MothersDay.swift
//  
//
//  Created by Evan Anderson on 6/24/22.
//

import Foundation
import SwiftSovereignStates

enum MothersDay : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "Mother's Day"
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .albania,
                .armenia,
                .azerbaijan:
            return HolidayDate(year: year, month: .march, day: 8)
        case .anguilla,
                .antigua_and_barbuda,
                .australia,
                .austria,
                .bahamas,
                .bangladesh,
                .belgium,
                .brazil,
                .canada,
                .china,
                .czech_republic,
                .estonia,
                .finland,
                .germany,
                .india,
                .italy,
                .japan,
                .latvia,
                .malta,
                .netherlands,
                .new_zealand,
                .pakistan,
                .philippines,
                .samoa,
                .singapore,
                .slovakia,
                .sri_lanka,
                .switzerland,
                .taiwan,
                .ukraine,
                .united_states:
            return HolidayDate.get_second(day_of_week: .sunday, month: .may, year: year)
        case .mexico:
            return HolidayDate(year: year, month: .may, day: 10)
        case .belarus: return HolidayDate(year: year, month: .october, day: 14)
        case .benin: return HolidayDate(year: year, month: .may, day: 14)
        case .bhutan: return HolidayDate(year: year, month: .may, day: 8)
        case .bolivia: return HolidayDate(year: year, month: .may, day: 27)
        case .egypt: return HolidayDate(year: year, month: .march, day: 21)
        case .georgia: return HolidayDate(year: year, month: .march, day: 3)
        case .hungary,
                .lithuania,
                .paraguay:
            return HolidayDate(year: year, month: .may, day: 15)
        case .indonesia: return HolidayDate(year: year, month: .december, day: 22)
        case .kyrgyzstan: return HolidayDate(year: year, month: .may, day: 19)
        case .malawi: return HolidayDate(year: year, month: .october, day: 15)
        case .maldives: return HolidayDate(year: year, month: .may, day: 13)
        case .nicaragua: return HolidayDate(year: year, month: .may, day: 30)
        case .north_korea: return HolidayDate(year: year, month: .november, day: 16)
        case .norway: return HolidayDate.get_second(day_of_week: .sunday, month: .february, year: year)
        case .panama: return HolidayDate(year: year, month: .december, day: 8)
        case .portugal,
                .romania,
                .spain:
            return HolidayDate.get_first(day_of_week: .sunday, month: .may, year: year)
        case .russia,
                .transnistria:
            return HolidayDate.get_last(day_of_week: .sunday, month: .november, year: year)
        case .south_sudan: return HolidayDate.get_first(day_of_week: .monday, month: .july, year: year)
        case .thailand: return HolidayDate(year: year, month: .august, day: 12)
        default:
            return nil
        }
    }
}
