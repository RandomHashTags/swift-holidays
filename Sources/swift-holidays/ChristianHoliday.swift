//
//  ChristianHoliday.swift
//  
//
//  Created by Evan Anderson on 7/1/22.
//

import Foundation
import SwiftSovereignStates

public protocol ChristianHoliday : Holiday {
    func isWestern() -> Bool
}
public extension ChristianHoliday {
    var wikipedia_name : String? {
        return Holidays.Christian.init(rawValue: "\(self)")?.wikipedia_name
    }
    var aliases : Set<String>? {
        return Holidays.Christian.init(rawValue: "\(self)")?.aliases
    }
    func get_date(country: Country?, year: Int) -> HolidayDate? {
        return Holidays.Christian.init(rawValue: "\(self)")?.getDate(isWestern: isWestern(), year: year)
    }
}
