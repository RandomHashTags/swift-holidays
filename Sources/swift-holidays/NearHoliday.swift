//
//  NearHoliday.swift
//
//
//  Created by Evan Anderson on 11/30/23.
//

import Foundation
import SwiftSovereignStates

public struct NearHoliday : Hashable {
    public let type:String, id:String
    public var name:String
    public let emoji:String?
    public var countries:[Country]?
    
    public init(type: String, id: String, name: String, emoji: String?, countries: [Country]? = nil) {
        self.type = type
        self.id = id
        self.name = name
        self.emoji = emoji
        self.countries = countries
    }
    
    public mutating func addCountry(country: Country) {
        if countries == nil {
            countries = [Country]()
        }
        countries?.append(country)
    }
}
