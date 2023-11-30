//
//  EventSources.swift
//
//
//  Created by Evan Anderson on 11/30/23.
//

import Foundation

public struct EventSources {
    public var sources:[EventSource]
    
    
    public mutating func append(_ source: EventSource) {
        sources.append(source)
    }
    public mutating func append(_ sources: EventSources?) {
        guard let sources:[EventSource] = sources?.sources else { return }
        self.sources.append(contentsOf: sources)
    }
    public mutating func append(_ sources: EventSources) {
        self.sources.append(contentsOf: sources.sources)
    }
    public mutating func append(contentsOf: [EventSource]) {
        sources.append(contentsOf: contentsOf)
    }
}

public struct EventSource {
    public let name:String
    public let url:String
}
