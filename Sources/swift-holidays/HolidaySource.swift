//
//  HolidaySource.swift
//  
//
//  Created by Evan Anderson on 6/22/22.
//

import Foundation

public enum HolidaySourceType : String {
    case national_today
    case time_and_date
    case united_nations
    case wikipedia
    
    func getName() -> String {
        switch self {
        case .national_today: return "National Today"
        case .time_and_date: return "Time and Date"
        case .united_nations: return "United Nations"
        case .wikipedia: return "Wikipedia"
        }
    }
    
    func getURL(holiday: String) -> String {
        switch self {
        case .national_today: return "https://nationaltoday.com/" + holiday.lowercased().replacingOccurrences(of: " ", with: "-") + "/"
        case .time_and_date: return "https://www.timeanddate.com/holidays/fun/" + holiday.lowercased().replacingOccurrences(of: " ", with: "-")
        case .united_nations: return ""
        case .wikipedia: return "https://en.wikipedia.org/wiki/" + holiday.replacingOccurrences(of: " ", with: "_")
        }
    }
}
