//
//  AmericanHoliday.swift
//  
//
//  Created by Evan Anderson on 6/22/22.
//

import Foundation
import SwiftSovereignStates

public extension Holidays {
    enum American : String, Holiday {
        case abraham_lincolns_birthday
        case child_health_day
        case harriet_tubman_day
        case helen_keller_day
        case juneteenth
        case labor_day
        case law_day
        case leif_erikson_day
        case loving_day
        case loyalty_day
        case malcolm_x_day
        case memorial_day
        case martin_luther_king_jr_day
        case national_aviation_day
        case national_freedom_day
        case national_pearl_harbor_remembrance_day
        case pan_american_aviation_day
        case patriots_day
        case rosa_parks_day_arrested
        case rosa_parks_day_birthday
        case thomas_jefferson_day
        case washingtons_birthday
        case white_cane_safety_day
        case wright_brothers_day
        
        public var type : HolidayType {
            return .american
        }
        
        public var wikipedia_name : String? {
            switch self {
            case .abraham_lincolns_birthday: return "Lincoln's Birthday"
            case .martin_luther_king_jr_day: return "Martin Luther King Jr. Day"
            case .patriots_day: return "Patriots' Day"
            case .rosa_parks_day_arrested, .rosa_parks_day_birthday: return "Rosa Parks Day"
            case .thomas_jefferson_day: return "Jefferson's Birthday"
            case .washingtons_birthday: return "Washington's Birthday"
            default: return nil
            }
        }
        
        public var aliases : Set<String>? {
            switch self {
            case .juneteenth: return ["Freedom Day", "Jubilee Day", "Liberation Day", "Emancipation Day"]
            case .patriots_day: return ["Patriot's Day"]
            case .memorial_day: return ["Decoration Day"]
            case .national_pearl_harbor_remembrance_day: return ["Pearl Harbor Remembrance Day", "Pearl Harbor Day"]
            case .martin_luther_king_jr_day: return ["Birth of Martin Luther King, Jr.", "MLK Day"]
            case .washingtons_birthday: return ["Presidents Day", "President's Day", "Presidents' Day"]
            case .white_cane_safety_day: return ["Blind Americans Equality Day"]
            default: return nil
            }
        }
        
        public func get_proclamation_date(country: Country?) -> HolidayDate? {
            switch self {
            case .abraham_lincolns_birthday: return nil
            case .child_health_day: return HolidayDate(year: 1929, month: Month.may, day: 1)
            case .harriet_tubman_day: return HolidayDate(year: 1990, month: Month.march, day: 10)
            case .helen_keller_day: return HolidayDate(year: 1980, month: Month.march, day: 27)
            case .juneteenth: return HolidayDate(year: 1866, month: Month.june, day: 19)
            case .labor_day: return HolidayDate(year: 1882, month: Month.september, day: 5)
            case .law_day: return HolidayDate(year: 1958, month: Month.may, day: 1)
            case .loyalty_day: return HolidayDate(year: 1921, month: Month.may, day: 1)
            case .leif_erikson_day: return HolidayDate(year: 1929, month: Month.october, day: 9)
            case .loving_day: return HolidayDate(year: 1967, month: Month.june, day: 12)
            case .pan_american_aviation_day: return HolidayDate(year: 1940, month: Month.december, day: 17)
            case .wright_brothers_day: return nil
            case .patriots_day: return HolidayDate(year: 1894, month: Month.april, day: 19)
            case .malcolm_x_day: return HolidayDate(year: 1979, month: Month.may, day: 19)
            case .memorial_day: return HolidayDate(year: 1868, month: Month.may, day: 30)
            case .national_aviation_day: return HolidayDate(year: 1939, month: Month.august, day: 19)
            case .national_freedom_day: return HolidayDate(year: 1942, month: Month.february, day: 1)
            case .national_pearl_harbor_remembrance_day: return HolidayDate(year: 1994, month: Month.december, day: 7)
            case .martin_luther_king_jr_day: return HolidayDate(year: 1986, month: Month.january, day: 20)
            case .rosa_parks_day_arrested: return nil
            case .rosa_parks_day_birthday: return nil
            case .thomas_jefferson_day: return HolidayDate(year: 1938, month: Month.april, day: 13)
            case .washingtons_birthday: return nil
            case .white_cane_safety_day: return HolidayDate(year: 1964, month: Month.october, day: 15)
            }
        }
        
        public func get_date(country: Country?, year: Int) -> HolidayDate? {
            switch self {
            case .abraham_lincolns_birthday: return HolidayDate(year: year, month: .february, day: 12)
            case .child_health_day: return HolidayDate.get_first(day_of_week: .monday, month: .october, year: year)
                //case GOLD_STAR_MOTHERS_AND_FAMILYS_DAY: return getLast(DayOfWeek.SUNDAY, Month.SEPTEMBER, year);
            case .harriet_tubman_day: return HolidayDate(year: year, month: .march, day: 10)
            case .helen_keller_day: return HolidayDate(year: year, month: .june, day: 27)
            case .juneteenth: return HolidayDate(year: year, month: .june, day: 19)
            case .labor_day: return HolidayDate.get_first(day_of_week: .monday, month: .september, year: year)
            case .law_day,
                    .loyalty_day:
                return HolidayDate(year: year, month: .may, day: 1)
            case .leif_erikson_day: return HolidayDate(year: year, month: .october, day: 9)
            case .loving_day: return  HolidayDate(year: year, month: .june, day: 12)
            case .pan_american_aviation_day,
                    .wright_brothers_day:
                return HolidayDate(year: year, month: .december, day: 17)
            case .patriots_day: return HolidayDate.get_third(day_of_week: .monday, month: .april, year: year)
            case .malcolm_x_day: return HolidayDate(year: year, month: .may, day: 19)
            case .memorial_day: return HolidayDate.get_last(day_of_week: .monday, month: .may, year: year)
            case .national_aviation_day: return HolidayDate(year: year, month: .august, day: 19)
            case .national_freedom_day: return HolidayDate(year: year, month: .february, day: 1)
            case .national_pearl_harbor_remembrance_day: return HolidayDate(year: year, month: .december, day: 7)
            case .martin_luther_king_jr_day: return HolidayDate.get_third(day_of_week: .monday, month: .january, year: year)
            case .rosa_parks_day_arrested: return HolidayDate(year: year, month: .february, day: 4)
            case .rosa_parks_day_birthday: return HolidayDate(year: year, month: .december, day: 1)
            case .thomas_jefferson_day: return HolidayDate(year: year, month: .april, day: 13)
            case .washingtons_birthday: return HolidayDate.get_third(day_of_week: .monday, month: .february, year: year)
            case .white_cane_safety_day: return HolidayDate(year: year, month: .october, day: 15)
            }
        }
        
        public func get_additional_sources(country: Country) -> EventSources? {
            switch self {
            case .abraham_lincolns_birthday:
                return EventSources(sources: [
                    EventSource(name: "Time and Date", url: "https://www.timeanddate.com/holidays/us/lincolns-birthday")
                ])
            case .labor_day:
                return EventSources(sources: [
                    EventSource(name: "U.S. Department of Labor", url: "https://www.dol.gov/general/laborday/history"),
                    EventSource(name: "Time and Date", url: "https://www.timeanddate.com/holidays/us/labor-day")
                ])
            case .national_freedom_day:
                return EventSources(sources: [
                    EventSource(name: "Time and Date", url: "https://www.timeanddate.com/holidays/us/national-freedom-day")
                ])
            default:
                return nil
            }
        }
    }
}
