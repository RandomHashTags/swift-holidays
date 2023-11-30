//
//  LabourDay.swift
//  
//
//  Created by Evan Anderson on 6/24/22.
//

import Foundation
import SwiftSovereignStates

enum LabourDay : String, CustomHoliday {
    case instance
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .afghanistan,
                .albania,
                .algeria,
                .andorra,
                .angola,
                .anguilla,
                .argentina,
                .armenia,
                .austria,
                .bahrain,
                .bangladesh,
                .barbados,
                .belarus,
                .belgium,
                .belize,
                .benin,
                .bolivia,
                .bosnia_and_herzegovina,
                .botswana,
                .brazil,
                .burkina_faso,
                .burundi,
                .cambodia,
                .cameroon,
                .cape_verde,
                .central_african_republic,
                .chad,
                .chile,
                .china,
                .colombia,
                .comoros,
                .costa_rica,
                .democratic_republic_of_the_congo,
                .republic_of_the_congo,
                .croatia,
                .cuba,
                .cyprus,
                .czech_republic,
                .denmark,
                .djibouti,
                .dominican_republic,
                .timor_leste,
                .ecuador,
                .egypt,
                .el_salvador,
                .eritrea,
                .estonia,
                .ethiopia,
                .france,
                .gabon,
                .gambia,
                .ghana,
                .greece,
                .guatemala,
                .guinea,
                .guyana,
                .haiti,
                .honduras,
                .hong_kong,
                .hungary,
                .iceland,
                .india,
                .ivory_coast,
                .jordan,
                .kenya,
                .kosovo,
                .kyrgyzstan,
                .latvia,
                .lebanon,
                .libya,
                .liechtenstein,
                .lithuania,
                .luxembourg,
                .macau,
                .madagascar,
                .malawi,
                .malaysia,
                .maldives,
                .mali,
                .malta,
                .mauritania,
                .mauritius,
                .mexico,
                .moldova,
                .montenegro,
                .morocco,
                .mozambique,
                .myanmar,
                .namibia,
                .netherlands,
                .nicaragua,
                .niger,
                .nigeria,
                .north_korea,
                .north_macedonia,
                .norway,
                .pakistan,
                .palestine,
                .panama,
                .paraguay,
                .peru,
                .philippines,
                .poland,
                .portugal,
                .romania,
                .russia,
                .rwanda,
                .san_marino,
                .senegal,
                .serbia,
                .seychelles,
                .singapore,
                .slovakia,
                .slovenia,
                .somalia,
                .south_africa,
                .south_korea,
                .south_sudan,
                .spain,
                .sri_lanka,
                .suriname,
                .switzerland,
                .syria,
                .sao_tome_and_principe,
                .taiwan,
                .tajikistan,
                .tanzania,
                .thailand,
                .togo,
                .tunisia,
                .turkey,
                .uganda,
                .ukraine,
                .uruguay,
                .vanuatu,
                .vatican_city,
                .venezuela,
                .vietnam,
                .yemen,
                .zambia,
                .zimbabwe:
            return HolidayDate(year: year, month: .may, day: 1)
        case .australia: return HolidayDate.get_first(day_of_week: .monday, month: .october, year: year)
        case .bahamas: return HolidayDate.get_first(day_of_week: .friday, month: .june, year: year)
        case .canada: return HolidayDate.get_first(day_of_week: .monday, month: .september, year: year)
        case .jamaica: return HolidayDate(year: year, month: .may, day: 23)
        case .japan:
            let date:HolidayDate = HolidayDate(year: year, month: .november, day: 23)
            return date.date.day_of_week == .sunday ? date.plus(.days(1)) : date
        case .kazakhstan: return HolidayDate.get_last(day_of_week: .sunday, month: .september, year: year)
        case .new_zealand: return HolidayDate.get_last(day_of_week: DayOfWeek.monday, month: .october, year: year)
        case .trinidad_and_tobago: return HolidayDate(year: year, month: .june, day: 19)
        case .united_kingdom: return HolidayDate.get_first(day_of_week: .monday, month: .may, year: year)
        default: return nil
        }
    }
    
}