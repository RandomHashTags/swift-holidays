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
    case chinese
    case christian_east
    case christian_west
    case fun
    case gregorian
    case mexican
    case united_nations
    case unofficial
    
    case countries
    
    public func get_holiday_type() -> (any Holiday.Type)? {
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
        default: return nil
        }
    }
    public var holidays : [any Holiday]? {
        return get_holiday_type()?.allCases as? [any Holiday]
    }
    public func get_holiday(identifier: String) -> (any Holiday)? {
        return get_holiday_type()?.init(rawValue: identifier)
    }
    
    public func get_celebrating_country() -> Country? {
        switch self {
        case .american: return Country.united_states
        case .australian: return Country.australia
        case .chinese: return Country.china
        case .mexican: return Country.mexico
        default: return nil
        }
    }
    
    public var emoji : String? {
        switch self {
        case .american: return Country.united_states.flag_emoji
        case .australian: return Country.australia.flag_emoji
        case .chinese: return Country.china.flag_emoji
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
}
