//
//  FathersDay.swift
//  
//
//  Created by Evan Anderson on 6/24/22.
//

import Foundation
import SwiftSovereignStates

enum FathersDay : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "Father's Day"
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .afghanistan,
                .algeria,
                .albania,
                .antigua_and_barbuda,
                .argentina,
                .bahamas,
                .bahrain,
                .bangladesh,
                .barbados,
                .belize,
                .bermuda,
                .bosnia_and_herzegovina,
                .botswana,
                .brunei,
                .burkina_faso,
                .cambodia,
                .canada,
                .chad,
                .chile,
                .china,
                .colombia,
                .comoros,
                .costa_rica,
                .cuba,
                .cyprus,
                .czech_republic,
                .dominica,
                .ecuador,
                .ethiopia,
                .france,
                .georgia,
                .ghana,
                .greece,
                .guernsey,
                .guyana,
                .hong_kong,
                .hungary,
                .india,
                .ireland,
                .ivory_coast,
                .jamaica,
                .japan,
                .jersey,
                .kenya,
                .kuwait,
                .laos,
                .macau,
                .mali,
                .madagascar,
                .malaysia,
                .maldives,
                .malta,
                .mauritius,
                .mexico,
                .morocco,
                .namibia,
                .netherlands,
                .nigeria,
                .oman,
                .pakistan,
                .panama,
                .paraguay,
                .peru,
                .philippines,
                .puerto_rico,
                .qatar,
                .saudi_arabia,
                .senegal,
                .singapore,
                .slovakia,
                .south_africa,
                .sri_lanka,
                .suriname,
                .tanzania,
                .trinidad_and_tobago,
                .tunisia,
                .turkey,
                .uganda,
                .united_kingdom,
                .united_states,
                .venezuela,
                .vietnam,
                .zambia,
                .zimbabwe:
            return HolidayDate.get_third(day_of_week: .sunday, month: .june, year: year)
        case .andorra,
                .angola,
                .bolivia,
                .croatia,
                .honduras,
                .italy,
                .liechtenstein,
                .mozambique,
                .portugal,
                .spain:
            return HolidayDate(year: year, month: .march, day: 19)
        case .australia,
                .fiji,
                .new_zealand,
                .papua_new_guinea:
            return HolidayDate.get_first(day_of_week: .sunday, month: .september, year: year)
        case .austria,
                .belgium:
            return HolidayDate.get_second(day_of_week: .sunday, month: .june, year: year)
        case .brazil,
                .samoa:
            return HolidayDate.get_second(day_of_week: .sunday, month: .august, year: year)
        case .bulgaria:
            return HolidayDate(year: year, month: .december, day: 26)
        case .denmark:
            return HolidayDate(year: year, month: .june, day: 5)
        case .egypt,
                .jordan,
                .lebanon,
                .sudan,
                .syria,
                .united_arab_emirates:
            return HolidayDate(year: year, month: .june, day: 21)
        case .estonia,
                .finland,
                .iceland,
                .norway,
                .sweden:
            return HolidayDate.get_second(day_of_week: .sunday, month: .november, year: year)
        case .germany: return Holidays.ChristianEast.feast_of_the_ascension.get_date(country: country, year: year)
        case .haiti:
            return HolidayDate.get_last(day_of_week: .sunday, month: .september, year: year)
        case .indonesia:
            return HolidayDate(year: year, month: .november, day: 12)
        case .latvia:
            return HolidayDate.get_second(day_of_week: .sunday, month: .september, year: year)
        case .lithuania,
                .switzerland:
            return HolidayDate.get_first(day_of_week: .sunday, month: .june, year: year)
        case .luxembourg:
            return HolidayDate.get_first(day_of_week: .sunday, month: .october, year: year)
        case .nicaragua,
                .poland:
            return HolidayDate(year: year, month: .june, day: 23)
        case .romania: return HolidayDate.get_second(day_of_week: .sunday, month: .may, year: year)
        case .seychelles: return HolidayDate(year: year, month: .june, day: 16)
        case .south_sudan: return HolidayDate.get_last(day_of_week: .monday, month: .august, year: year)
        case .taiwan: return HolidayDate(year: year, month: .august, day: 8)
        case .thailand: return HolidayDate(year: year, month: .december, day: 5)
        case .tonga: return HolidayDate.get_third(day_of_week: .sunday, month: .may, year: year)
        default:
            return nil
        }
    }
}
