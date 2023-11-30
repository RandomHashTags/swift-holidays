//
//  VeteransDay.swift
//  
//
//  Created by Evan Anderson on 6/24/22.
//

import Foundation
import SwiftSovereignStates

enum VeteransDay : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "Veterans' Day"
    }
    
    public var aliases : Set<String>? {
        return ["Armed Forces Day", "Armistice Day"]
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .finland: return HolidayDate(year: year, month: .april, day: 27)
        case .netherlands,
                .united_kingdom:
            return HolidayDate.get_last(day_of_week: .saturday, month: .june, year: year)
        case .norway: return HolidayDate(year: year, month: .may, day: 8)
        case .south_korea: return HolidayDate(year: year, month: .october, day: 8)
        case .sweden: return HolidayDate(year: year, month: .may, day: 29)
        case .united_states: return HolidayDate(year: year, month: .november, day: 11)
        default: return nil
        }
    }
    
    public func get_sources(country: Country) -> HolidaySources {
        switch country {
        case .finland:
            return HolidaySources(sources: [HolidaySource(name: "Wikipedia: National Veterans' Day", url: "https://en.wikipedia.org/wiki/National_Veterans%27_Day")])
        case .netherlands:
            return HolidaySources(sources: [HolidaySource(name: "Wikipedia: Veterans' Day (Netherlands)", url: "https://en.wikipedia.org/wiki/Veterans%27_Day_(Netherlands)")])
        case .norway:
            return HolidaySources(sources: [HolidaySource(name: "Wikipedia: Veterans Day (Norway)", url: "https://en.wikipedia.org/wiki/Veterans_Day_(Norway)")])
        case .south_korea:
            return HolidaySources(sources: [HolidaySource(name: "Wikipedia: Veterans Day (South Korea)", url: "https://en.wikipedia.org/wiki/Veterans_Day_(South_Korea)")])
        case .sweden:
            return HolidaySources(sources: [HolidaySource(name: "Wikipedia: Veterans Day (Sweden)", url: "https://en.wikipedia.org/wiki/Veterans_Day_(Sweden)")])
        case .united_kingdom:
            return HolidaySources(sources: [HolidaySource(name: "Wikipedia: Armed Forces Day (United Kingdom)", url: "https://en.wikipedia.org/wiki/Armed_Forces_Day_(United_Kingdom)")])
        default:
            return default_sources
        }
    }
}
