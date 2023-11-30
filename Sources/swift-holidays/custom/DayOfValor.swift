//
//  DayOfValor.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

enum DayOfValor : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "Day of Valor"
    }
    
    public var aliases : Set<String>? {
        return ["Bataan Day", "Bataan and Corregidor Day"]
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .philippines: return HolidayDate(year: year, month: .april, day: 9)
        default: return nil
        }
    }
}
