//
//  HolidayType.swift
//  
//
//  Created by Evan Anderson on 6/17/22.
//

import Foundation
import SwiftSovereignStates

public enum HolidayType : String, CaseIterable {
    case american
    case australian
    //case chinese
    case christian_east
    case christian_west
    case fun
    case gregorian
    case mexican
    case united_nations
    case unofficial
    
    case countries
    
    public var holidayType : (any Holiday.Type) {
        switch self {
        case .american:        return Holidays.American.self
        case .australian:      return Holidays.Australian.self
        case .christian_east:  return Holidays.ChristianEast.self
        case .christian_west:  return Holidays.ChristianWest.self
        case .fun:             return Holidays.Fun.self
        case .gregorian:       return Holidays.Gregorian.self
        case .mexican:         return Holidays.Mexican.self
        case .united_nations:  return Holidays.UnitedNations.self
        case .unofficial:      return Holidays.Unofficial.self
        case .countries:       return Holidays.Social.self
        }
    }
    public var holidays : [any Holiday] {
        return holidayType.allCases as! [any Holiday]
    }
    public func getHoliday(identifier: String) -> (any Holiday)? {
        return holidayType.init(rawValue: identifier)
    }
    
    public var celebratingCountry : Country? {
        switch self {
        case .american: return Country.united_states
        case .australian: return Country.australia
        //case .chinese: return Country.china
        case .mexican: return Country.mexico
        default: return nil
        }
    }
    
    public var emoji : String? {
        switch self {
        case .american: return Country.united_states.flag_emoji
        case .australian: return Country.australia.flag_emoji
        //case .chinese: return Country.china.flag_emoji
        case .christian_east: return "✝"
        case .christian_west: return "✝"
        case .fun: return "🤪"
        case .gregorian: return "📅"
        case .mexican: return Country.mexico.flag_emoji
        case .united_nations: return "🇺🇳"
        case .unofficial: return "📆"
            
        case .countries: return nil
        }
    }
    
    public func getHolidays(for country: Country, year: Int) -> [HolidayDate:[NearHoliday]] {
        var list:[HolidayDate:[String:NearHoliday]] = [HolidayDate:[String:NearHoliday]]()
        let holidays:[any Holiday] = holidays
        for holiday in holidays {
            insert_near_holidays(country: country, holiday: holiday, starting_date: nil, ending_date: nil, year: year, list: &list)
        }
        
        var allHolidays:[HolidayDate:[NearHoliday]] = [HolidayDate:[NearHoliday]]()
        for (eventDate, bruh) in list {
            allHolidays[eventDate] = bruh.values.map({ $0 })
        }
        return allHolidays
    }
    public func getHolidays(startingDate: Date, endingDate: Date) -> [HolidayDate:[NearHoliday]] {
        let holidays:[any Holiday] = holidays
        let calendar:Calendar = Calendar.current
        let startingYear:Int = calendar.component(.year, from: startingDate), endingYear:Int = calendar.component(.year, from: endingDate)
        var years:[Int] = [startingYear]
        if startingYear != endingYear {
            years.append(endingYear)
        }
        
        var list:[HolidayDate:[String:NearHoliday]] = [HolidayDate:[String:NearHoliday]]()
        let startingEventDate:HolidayDate = HolidayDate(startingDate), endingEventDate:HolidayDate = HolidayDate(endingDate)
        let unCountry:Country? = self == .united_nations ? .united_states : celebratingCountry
        if let countries:[Country] = self == .countries ? Country.allCases : nil {
            for holiday in holidays {
                for year in years {
                    for country in countries {
                        insert_near_holidays(country: country, holiday: holiday, starting_date: startingEventDate, ending_date: endingEventDate, year: year, list: &list)
                    }
                }
            }
        } else {
            for holiday in holidays {
                for year in years {
                    insert_near_holidays(country: unCountry, holiday: holiday, starting_date: startingEventDate, ending_date: endingEventDate, year: year, list: &list)
                }
            }
        }
        
        var allHolidays:[HolidayDate:[NearHoliday]] = [HolidayDate:[NearHoliday]]()
        for (eventDate, bruh) in list {
            allHolidays[eventDate] = bruh.values.map({ $0 })
        }
        return allHolidays
    }
    private func insert_near_holidays(country: Country?, holiday: any Holiday, starting_date: HolidayDate!, ending_date: HolidayDate!, year: Int, list: inout [HolidayDate:[String:NearHoliday]]) {
        guard let eventDate:HolidayDate = holiday.get_date(country: country, year: year), (starting_date == nil || ending_date == nil || eventDate >= starting_date && eventDate <= ending_date) else { return }
        if list[eventDate] == nil {
            list[eventDate] = [String:NearHoliday]()
        }
        let name:String = holiday.name, type:HolidayType = holiday.type
        if list[eventDate]![name] == nil {
            list[eventDate]![name] = NearHoliday(type: type.rawValue, id: "\(holiday)", name: name, emoji: emoji)
        }
        if let country:Country = country, type != .united_nations {
            list[eventDate]![name]!.addCountry(country: country)
        }
    }
}
