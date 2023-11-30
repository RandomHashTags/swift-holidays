//
//  UnofficialHoliday.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

public extension Holidays {
    enum Unofficial : String, Holiday {
        case april_fools_day
        case disaster_prevention_day
        case evolution_day
        case galactic_tick_day
        case international_mens_day
        case national_cashew_day
        case national_donut_day
        case national_honey_bee_day
        case national_intern_day
        case national_nude_day
        case national_puzzle_day
        case national_shower_with_a_friend_day
        case spirit_day
        case square_root_day
        case super_bowl_sunday
        case wear_it_purple_day
        case world_contact_day
        
        public var type : HolidayType {
            return .unofficial
        }
        
        public var wikipedia_name : String? {
            switch self {
            case .april_fools_day: return "April Fools' Day"
            case .international_mens_day: return "International Men's Day"
            default: return nil
            }
        }
        
        public var aliases : Set<String>? {
            return nil
        }
        
        public func get_date(country: Country?, year: Int) -> HolidayDate? {
            switch self {
            case .april_fools_day: return HolidayDate(year: year, month: .april, day: 1)
            case .disaster_prevention_day:
                return country == .japan ? HolidayDate(year: year, month: .september, day: 1) : nil
            case .evolution_day: return HolidayDate(year: year, month: .november, day: 24)
            case .galactic_tick_day: return getGalacticTickDay(year)
            case .international_mens_day: return HolidayDate(year: year, month: .november, day: 19)
                
            case .national_cashew_day:
                guard let country:Country = country else { return nil }
                switch country {
                case .united_states: return HolidayDate(year: year, month: .november, day: year)
                default: return nil
                }
            case .national_donut_day: return NationalDonutDay.instance.get_date(country: country, year: year)
            case .national_honey_bee_day: return country == .united_states ? HolidayDate.get_third(day_of_week: .saturday, month: .august, year: year) : nil
            case .national_intern_day: return country == .united_states ? HolidayDate.get_last(day_of_week: .thursday, month: .june, year: year) : nil
            case .national_nude_day: return HolidayDate(year: year, month: .july, day: 14)
            case .national_puzzle_day: return country == .united_states ? HolidayDate(year: year, month: .january, day: 29) : nil
            case .national_shower_with_a_friend_day: return country == .united_states ? HolidayDate(year: year, month: .february, day: 5) : nil
                
            case .spirit_day:
                guard let country:Country = country else { return nil }
                switch country {
                case .canada,
                        .united_states:
                    return HolidayDate.get_third(day_of_week: .thursday, month: .october, year: year)
                default:
                    return nil
                }
            case .square_root_day:
                var bruh:String = String(describing: year)
                var string:Substring = bruh[bruh.startIndex..<bruh.index(bruh.endIndex, offsetBy: -2)]
                switch string {
                case "01": return HolidayDate(year: year, month: .january, day: 1)
                case "04": return HolidayDate(year: year, month: .february, day: 2)
                case "09": return HolidayDate(year: year, month: .march, day: 3)
                case "16": return HolidayDate(year: year, month: .april, day: 4)
                case "25": return HolidayDate(year: year, month: .may, day: 5)
                case "36": return HolidayDate(year: year, month: .june, day: 6)
                case "49": return HolidayDate(year: year, month: .july, day: 7)
                case "64": return HolidayDate(year: year, month: .august, day: 8)
                case "81": return HolidayDate(year: year, month: .september, day: 9)
                default: return nil
                }
            case .super_bowl_sunday:
                return year <= 2021 ? HolidayDate.get_first(day_of_week: .sunday, month: .february, year: year) : HolidayDate.get_second(day_of_week: .sunday, month: .february, year: year)
            case .wear_it_purple_day:
                return country == .australia ? HolidayDate.get_last(day_of_week: .friday, month: .august, year: year) : nil
            case .world_contact_day: return HolidayDate(year: year, month: .march, day: 15)
            }
        }
        
        // tick day = (October 2, 1608) + (1.7361 * tickDayNumber)
        private func getGalacticTickDay(_ year: Int) -> HolidayDate? {
            let calendar:Calendar = Calendar.current
            var startDateComponents:DateComponents = DateComponents()
            startDateComponents.calendar = calendar
            startDateComponents.year = 1608
            startDateComponents.month = 10
            startDateComponents.day = 2
            guard let startDate:Date = calendar.date(from: startDateComponents) else { return nil }
            let intervalYears:Double = 1.7361, intervalDays:Double = (.days(365) + .hours(5) + .minutes(48) + 46) * 1.7361
            let yearsSince:Int = calendar.component(.year, from: Date.now) - startDateComponents.year!
            //let leapYearsSince:Int = (yearsSince % 400)
            //print("UnofficialHoliday;;getGalacticTickDay;leapYearsSince=" + leapYearsSince.description)
            let startingTickNumber:Int = Int(Double(yearsSince) / intervalYears) - 5
            for tickNumber in startingTickNumber..<500 {
                let days:TimeInterval = Double(tickNumber) * intervalDays
                let targetDate:Date = startDate.addingTimeInterval(days)
                let targetYear:Int = calendar.component(.year, from: targetDate)
                //print("UnofficialHoliday;getGalacticTickDay;tickNumber=" + tickNumber.description + ";targetYear=" + HolidayDate.getDateString(date: targetDate))
                if targetYear == year {
                    return HolidayDate(targetDate)
                } else if targetYear > year {
                    return nil
                }
            }
            return nil
        }
        
        public var source : HolidaySourceType {
            switch self {
            case .national_puzzle_day,
                    .national_shower_with_a_friend_day:
                return .national_today
            default:
                return .wikipedia
            }
        }
    }
}
