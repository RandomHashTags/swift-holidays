//
//  Holiday.swift
//  
//
//  Created by Evan Anderson on 6/17/22.
//

import Foundation
import Kanna
import SwiftSovereignStates

public protocol Holiday : CaseIterable, RawRepresentable where RawValue == String {
    var type : HolidayType { get }
    var name : String { get }
    var wikipedia_name : String? { get }
    var aliases : Set<String>? { get }
    func get_sources(country: Country) -> HolidaySources
    func get_additional_sources(country: Country) -> HolidaySources?
    var source : HolidaySourceType { get }
    func get_proclamation_date(country: Country?) -> HolidayDate?
    func get_date(country: Country?, year: Int) -> HolidayDate?
}
public extension Holiday {
    var name : String {
        return wikipedia_name ?? Holidays.to_correct_capitalization(input: "\(self)", excluded_words: ["of", "and", "de", "the", "it", "in", "for", "to"])
    }
    var wikipedia_name : String? {
        return nil
    }
    
    var default_sources : HolidaySources {
        return HolidaySources(sources: [HolidaySource(name: source.getName() + ": " + name, url: url)])
    }
    func get_additional_sources(country: Country) -> HolidaySources? {
        return nil
    }
    func get_sources(country: Country) -> HolidaySources {
        var sources:HolidaySources = default_sources
        sources.append(get_additional_sources(country: country))
        return sources
    }
    
    var source : HolidaySourceType {
        return .wikipedia
    }
    private var url : String {
        return source.getURL(holiday: name)
    }
    
    func get_proclamation_date(country: Country?) -> HolidayDate? {
        return nil
    }
}

public protocol CustomHoliday : Holiday {
    func get_date(country: Country, year: Int) -> HolidayDate?
}
public extension CustomHoliday {
    func get_date(country: Country?, year: Int) -> HolidayDate? {
        guard let country:Country = country else { return nil }
        return get_date(country: country, year: year)
    }
    var type : HolidayType {
        return HolidayType.countries
    }
    var aliases : Set<String>? {
        return nil
    }
}
