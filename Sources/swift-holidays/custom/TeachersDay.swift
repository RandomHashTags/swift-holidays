//
//  TeachersDay.swift
//  
//
//  Created by Evan Anderson on 6/24/22.
//

import Foundation
import SwiftSovereignStates

enum TeachersDay : String, CustomHoliday {
    case instance
    
    public var wikipedia_name : String? {
        return "Teacher's Day"
    }
    
    public func get_date(country: Country, year: Int) -> HolidayDate? {
        switch country {
        case .albania,
                .kosovo:
            return HolidayDate(year: year, month: .march, day: 7)
        case .argentina: return HolidayDate(year: year, month: .september, day: 11)
        case .armenia,
                .azerbaijan,
                .bahrain,
                .bangladesh,
                .belgium,
                .bulgaria,
                .cameroon,
                .canada,
                .croatia,
                .estonia,
                .georgia,
                .germany,
                .kuwait,
                .lithuania,
                .maldives,
                .mauritius,
                .moldova,
                .mongolia,
                .myanmar,
                .netherlands,
                .nigeria,
                .north_macedonia,
                .pakistan,
                .papua_new_guinea,
                .philippines,
                .portugal,
                .qatar,
                .romania,
                .russia,
                .saudi_arabia,
                .serbia,
                .united_arab_emirates,
                .united_kingdom:
            return HolidayDate(year: year, month: .october, day: 5)
        case .australia:
            guard let date:HolidayDate = HolidayDate.get_last(day_of_week: .friday, month: .october, year: year), let day:Int = date.components.day else { return nil }
            return day == 31 ? HolidayDate(year: year, month: .november, day: 7) : date
        case .belarus,
                .kazakhstan,
                .latvia,
                .ukraine:
            return HolidayDate.get_first(day_of_week: .sunday, month: .october, year: year)
        case .bhutan,
                .iran:
            return HolidayDate(year: year, month: .may, day: 2)
        case .bolivia: return HolidayDate(year: year, month: .june, day: 6)
        case .brazil: return HolidayDate(year: year, month: .october, day: 15)
        case .brunei: return HolidayDate(year: year, month: .september, day: 23)
        case .chile: return HolidayDate(year: year, month: .october, day: 16)
        case .china,
                .hong_kong:
            return HolidayDate(year: year, month: .september, day: 10)
        case .colombia: return HolidayDate(year: year, month: .may, day: 15)
        case .costa_rica,
                .cuba:
            return HolidayDate(year: year, month: .december, day: 22)
        case .czech_republic: return HolidayDate(year: year, month: .march, day: 28)
        case .dominican_republic: return HolidayDate(year: year, month: .june, day: 30)
        case .ecuador: return HolidayDate(year: year, month: .april, day: 13)
        case .egypt,
                .jordan,
                .libya,
                .morocco,
                .tunisia,
                .yemen:
            return HolidayDate(year: year, month: .february, day: 28)
        case .el_salvador: return HolidayDate(year: year, month: .june, day: 22)
        case .greece: return HolidayDate(year: year, month: .january, day: 30)
        case .guatemala: return HolidayDate(year: year, month: .june, day: 25)
        case .honduras: return HolidayDate(year: year, month: .september, day: 17)
        case .hungary: return HolidayDate.get_first(day_of_week: .sunday, month: .june, year: year)
        case .indonesia: return HolidayDate(year: year, month: .november, day: 25)
        case .iraq: return HolidayDate(year: year, month: .march, day: 1)
        case .jamaica: return HolidayDate(year: year, month: .may, day: 6)
        case .laos: return HolidayDate(year: year, month: .october, day: 7)
        case .lebanon: return HolidayDate(year: year, month: .march, day: 9)
        case .malaysia: return HolidayDate(year: year, month: .may, day: 16)
        case .mexico,
                .south_korea:
            return HolidayDate(year: year, month: .may, day: 15)
        case .new_zealand: return HolidayDate(year: year, month: .october, day: 29)
        case .oman: return HolidayDate(year: year, month: .february, day: 24)
        case .palestine: return HolidayDate(year: year, month: .december, day: 14)
        case .panama,
                .south_sudan:
            return HolidayDate(year: year, month: .december, day: 1)
        case .paraguay: return HolidayDate(year: year, month: .april, day: 30)
        case .peru: return HolidayDate(year: year, month: .july, day: 6)
        case .poland: return HolidayDate(year: year, month: .october, day: 14)
        case .singapore: return HolidayDate.get_first(day_of_week: .friday, month: .september, year: year)
        case .slovakia: return HolidayDate(year: year, month: .march, day: 28)
        case .somalia: return HolidayDate(year: year, month: .november, day: 21)
        case .spain: return HolidayDate(year: year, month: .november, day: 27)
        case .sri_lanka: return HolidayDate(year: year, month: .october, day: 6)
        case .syria: return HolidayDate(year: year, month: .march, day: 18)
        case .taiwan: return HolidayDate(year: year, month: .september, day: 28)
        case .thailand: return HolidayDate(year: year, month: .january, day: 16)
        case .turkey: return HolidayDate(year: year, month: .november, day: 24)
        case .uruguay: return HolidayDate(year: year, month: .september, day: 22)
        case .uzbekistan: return HolidayDate(year: year, month: .october, day: 1)
        case .venezuela: return HolidayDate(year: year, month: .january, day: 15)
        case .vietnam: return HolidayDate(year: year, month: .november, day: 20)
        default:
            return nil
        }
    }
    
    public func get_sources(country: Country) -> HolidaySources {
        return HolidaySources(sources: [HolidaySource(name: "Wikipedia: List of Teacher's Days", url: "https://en.wikipedia.org/wiki/List_of_Teachers'_Days")])
    }
}
