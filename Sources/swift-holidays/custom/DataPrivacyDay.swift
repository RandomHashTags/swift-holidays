//
//  DataPrivacyDay.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

enum DataPrivacyDay : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "Data Privacy Day"
    }
    
    public var aliases : Set<String>? {
        return ["Data Protection Day", "National Data Privacy Day"]
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .albania,
                .andorra,
                .armenia,
                .austria,
                .azerbaijan,
            
                .belgium,
                .bosnia_and_herzegovina,
                .bulgaria,
                
                .canada,
                .croatia,
                .cyprus,
                .czech_republic,
            
                .denmark,
            
                .estonia,
            
                .faroe_islands,
                .finland,
                .france,
            
                .georgia,
                .germany,
                .greece,
                .greenland,
            
                .hungary,
            
                .iceland,
                .ireland,
                .israel,
                .italy,
            
                .latvia,
                .liechtenstein,
                .lithuania,
                .luxembourg,
            
                .malta,
                .moldova,
                .montenegro,
            
                .netherlands,
                .nigeria,
                .north_macedonia,
                .norway,
            
                .poland,
                .portugal,
            
                .romania,
                .russia,
            
                .san_marino,
                .scotland,
                .serbia,
                .slovakia,
                .slovenia,
                .spain,
                .sweden,
                .switzerland,
            
                .turkey,
            
                .ukraine,
                .united_kingdom,
                .united_states
            :
            return HolidayDate(year: year, month: .january, day: 28)
        default:
            return nil
        }
    }
}
