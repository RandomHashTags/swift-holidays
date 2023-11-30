//
//  HolidaySources.swift
//
//
//  Created by Evan Anderson on 11/30/23.
//

import Foundation

public struct HolidaySources {
    public var sources:[HolidaySource]
    
    public mutating func append(_ source: HolidaySource) {
        sources.append(source)
    }
    public mutating func append(_ sources: HolidaySources?) {
        guard let sources:[HolidaySource] = sources?.sources else { return }
        self.sources.append(contentsOf: sources)
    }
    public mutating func append(_ sources: HolidaySources) {
        self.sources.append(contentsOf: sources.sources)
    }
    public mutating func append(contentsOf: [HolidaySource]) {
        sources.append(contentsOf: contentsOf)
    }
}

public struct HolidaySource {
    public let name:String
    public let url:String
}
