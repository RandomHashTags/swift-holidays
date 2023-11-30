//
//  FunHolidays.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

public extension Holidays {
    enum Fun : String, Holiday {
        case book_lovers_day
        case darwin_day
        case fibonacci_day
        case international_beer_day
        case international_dna_day
        case international_dog_day
        case international_programmers_day
        case mole_day
        case national_boyfriend_day
        case national_girlfriend_day
        case national_science_fiction_day
        case pi_day
        case polar_bear_plunge_day
        case star_wars_day
        case ugly_sweater_day
        case wikipedia_day
        case world_emoji_day
        case world_logic_day
        case world_photography_day
        
        public var type : HolidayType {
            return .fun
        }
        
        public var wikipedia_name : String? {
            switch self {
            case .international_dna_day: return "DNA Day"
            default: return nil
            }
        }
        
        public var source : HolidaySource {
            switch self {
            case .book_lovers_day,
                    .darwin_day,
                    .international_beer_day,
                    .international_programmers_day,
                    .mole_day,
                    .national_science_fiction_day,
                    .pi_day,
                    .star_wars_day,
                    .wikipedia_day,
                    .world_emoji_day,
                    .world_logic_day,
                    .world_photography_day:
                return .wikipedia
            case .international_dog_day:
                return .national_today
            default:
                return .time_and_date
            }
        }
        
        public var aliases : Set<String>? {
            switch self {
            case .book_lovers_day: return ["National Book Lovers Day"]
            case .international_dna_day: return ["International DNA Day", "National DNA Day", "World DNA Day"]
            case .polar_bear_plunge_day: return ["New Year's Dive", "Polar Bear Swim Day"]
            case .world_photography_day: return ["World Photo Day"]
            default: return nil
            }
        }
        
        public func get_date(country: Country?, year: Int) -> HolidayDate? {
            switch self {
            case .book_lovers_day: return HolidayDate(year: year, month: .august, day: 9)
            case .darwin_day: return HolidayDate(year: year, month: .february, day: 12)
            case .fibonacci_day: return HolidayDate(year: year, month: .november, day: 23)
            case .international_beer_day: return HolidayDate.get_first(day_of_week: .friday, month: .august, year: year)
            case .international_dna_day: return HolidayDate(year: year, month: .april, day: 25)
            case .international_dog_day: return HolidayDate(year: year, month: .august, day: 26)
            case .international_programmers_day:
                if country == .china {
                    return HolidayDate(year: year, month: .october, day: 24)
                } else {
                    var components:DateComponents = DateComponents()
                    components.year = year
                    components.day = 256
                    guard let date:Date = Calendar.current.date(from: components) else { return nil }
                    return HolidayDate(date)
                }
            case .mole_day: return HolidayDate(year: year, month: .october, day: 23)
            case .national_boyfriend_day: return HolidayDate(year: year, month: .october, day: 3)
            case .national_girlfriend_day: return HolidayDate(year: year, month: .august, day: 1)
            case .national_science_fiction_day:
                return country == .united_states ? HolidayDate(year: year, month: .june, day: 2) : nil
            case .pi_day: return HolidayDate(year: year, month: .march, day: 14)
            case .polar_bear_plunge_day:
                guard let country:Country = country else { return nil }
                switch country {
                case .canada,
                        .united_states:
                    return HolidayDate(year: year, month: .january, day: 1)
                default:
                    return nil
                }
            case .star_wars_day: return HolidayDate(year: year, month: .may, day: 4)
            case .ugly_sweater_day: return HolidayDate.get_third(day_of_week: .friday, month: .december, year: year)
            case .wikipedia_day: return HolidayDate(year: year, month: .january, day: 15)
            case .world_emoji_day: return HolidayDate(year: year, month: .july, day: 17)
            case .world_logic_day: return HolidayDate(year: year, month: .january, day: 14)
            case .world_photography_day: return HolidayDate(year: year, month: .august, day: 19)
            }
        }
        
        public func get_sources(country: Country) -> EventSources {
            let timeAndDate:String = "Time and Date: " + name
            let nationalToday:String = "National Today: " + name
            switch self {
            case .book_lovers_day:
                return EventSources(sources: [
                    EventSource(name: "Wikipedia: " + name, url: "https://en.wikipedia.org/wiki/Book_Lovers_Day"),
                    EventSource(name: timeAndDate, url: "https://www.timeanddate.com/holidays/fun/book-lovers-day")
                ])
            case .fibonacci_day:
                return EventSources(sources: [
                    EventSource(name: timeAndDate, url: "https://www.timeanddate.com/holidays/fun/fibonacci-day"),
                    EventSource(name: nationalToday, url: "https://nationaltoday.com/fibonacci-day/")
                ]
                )
            case .national_boyfriend_day:
                return EventSources(sources: [EventSource(name: nationalToday, url: "https://nationaltoday.com/national-boyfriend-day/")])
            case .national_girlfriend_day:
                return EventSources(sources: [EventSource(name: nationalToday, url: "https://nationaltoday.com/national-girlfriend-day/")])
            case .world_photography_day:
                return EventSources(sources: [EventSource(name: "Official Website", url: "https://www.worldphotographyday.com")])
            default:
                return EventSources(sources: [EventSource(name: "Time and Date: Fun Holidays", url: "https://www.timeanddate.com/holidays/fun/")])
            }
        }
    }
}
