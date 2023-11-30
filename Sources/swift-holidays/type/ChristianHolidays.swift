//
//  ChristianHolidays.swift
//  
//
//  Created by Evan Anderson on 7/1/22.
//

import Foundation
import SwiftSovereignStates

public extension Holidays {
    enum Christian : String, Holiday {
        case all_saints_day
        case all_souls_day
        case ash_wednesday
        case assumption_of_mary
        case christmas
        case christmas_eve
        case easter
        case easter_monday
        case epiphany
        case feast_of_the_ascension
        case good_friday
        case halloween
        case holy_saturday
        case holy_tuesday
        case immaculate_conception
        case mardi_gras
        case palm_sunday
        case pentecost
        case saint_josephs_day
        case saint_patricks_day
        case valentines_day
        case whit_monday
        
        public var type : HolidayType {
            return HolidayType.christian_west
        }
        
        public var wikipedia_name : String? {
            switch self {
            case .all_saints_day: return "All Saints' Day"
            case .all_souls_day: return "All Souls' Day"
            case .saint_josephs_day: return "Saint Joseph's Day"
            case .saint_patricks_day: return "Saint Patrick's Day"
            case .valentines_day: return "Valentine's Day"
            default: return nil
            }
        }
        
        public var aliases : Set<String>? {
            switch self {
            case .all_saints_day: return ["All Hallows' Day", "Hallowmas", "Feast of All Saints", "Solemnity of All Saints"]
            case .all_souls_day: return ["Commemoration of All the Faithful Departed", "Day of Remembrance", "Day of the Dead", "Feast of All Souls"]
            case .assumption_of_mary: return ["Assumption of the Blessed Virgin Mary", "Falling Asleep of the Blessed Virgin Mary", "The Assumption"]
            case .christmas: return ["Feast of the Nativity", "Noël", "Xmas"]
            case .christmas_eve: return ["Day before Christmas", "Vigil of Christmas", "Night before Christmas"]
            case .easter: return ["Pascha", "Resurrection Sunday"]
            case .epiphany: return ["Baptism of Jesus", "Little Christmas", "Three Kings Day", "Theophany"]
            case .feast_of_the_ascension: return ["Feast of the Ascension of Jesus Christ", "Ascension Day", "Ascension Thursday", "Holy Thursday"]
            case .good_friday: return ["Crucified Friday", "Holy Friday", "Great Friday", "Great and Holy Friday", "Black Friday"]
            case .halloween: return ["Allhalloween", "All Hallows' Eve", "All Saints' Eve", "Hallowe'en"]
            case .holy_saturday: return ["Black Saturday", "Easter Eve", "Great and Holy Saturday", "Great Sabbath", "Hallelujah Saturday", "Holy and Great Saturday", "Joyous Saturday", "Saturday of the Gloria", "the Saturday of Light"]
            case .holy_tuesday: return ["Fig Tuesday", "Great and Holy Tuesday", "Great Tuesday"]
            case .mardi_gras: return ["Fat Tuesday", "Pancake Tuesday", "Shrove Tuesday"]
            case .pentecost: return ["Trinity Sunday", "White Sunday", "Whitsunday", "Whitsun"]
            case .saint_josephs_day: return ["Feast of Saint Joseph", "Solemnity of Saint Joseph"]
            case .saint_patricks_day: return ["Feast of Saint Patrick", "Patrick's Day", "St. Paddy's Day", "St. Patty's Day"]
            case .valentines_day: return ["Feast of Saint Valentine", "Saint Valentine's Day"]
            case .whit_monday: return ["Memorial of the Blessed Virgin Mary, Mother of the Church", "Monday of the Holy Spirit", "Pentecost Monday"]
            default: return nil
            }
        }
        
        public func get_date(country: Country?, year: Int) -> HolidayDate? {
            return nil
        }
        
        func getDate(isWestern: Bool, year: Int) -> HolidayDate? {
            switch self {
            case .all_saints_day:
                if isWestern {
                    return HolidayDate(year: year, month: .november, day: 1)
                } else {
                    guard let pentecost:DateComponents = Holidays.Christian.pentecost.getDate(isWestern: false, year: year)?.components, let month:Month = Month.init(rawValue: pentecost.month!), let day:Int = pentecost.day else { return nil }
                    return HolidayDate.get_first_after(day_of_week: .sunday, year: year, month: month, day: day)
                }
            case .all_souls_day:
                return HolidayDate(year: year, month: .november, day: 2)
            case .ash_wednesday:
                if isWestern {
                    let sevenWeeksBefore:DateComponents = Holidays.Christian.getEasterDatePlusDays(isWestern: true, year: year, days: -7*7).components
                    guard let month:Month = Month.init(rawValue: sevenWeeksBefore.month!), let day:Int = sevenWeeksBefore.day else { return nil }
                    return HolidayDate.get_first_after(day_of_week: .wednesday, year: year, month: month, day: day)
                } else {
                    return nil
                }
            case .assumption_of_mary:
                return HolidayDate(year: year, month: .august, day: 15)
            case .christmas:
                return isWestern ? HolidayDate(year: year, month: .december, day: 25) : HolidayDate(year: year, month: .january, day: 7)
            case .christmas_eve:
                guard let christmas:HolidayDate = Holidays.Christian.christmas.getDate(isWestern: isWestern, year: year) else { return nil }
                return christmas.plus(.days(-1))
            case .easter:
                return Holidays.Christian.getEasterDate(isWestern: isWestern, year: year)
            case .easter_monday:
                return Holidays.Christian.getEasterDatePlusDays(isWestern: isWestern, year: year, days: 1)
            case .epiphany:
                let targetDate:HolidayDate = HolidayDate(year: year, month: .january, day: 6)
                if isWestern {
                    return targetDate
                } else {
                    return targetDate.plus(.days(Holidays.Christian.getDifferenceGregorianJulianDays(date: targetDate)))
                }
            case .feast_of_the_ascension:
                return Holidays.Christian.getEasterDatePlusDays(isWestern: isWestern, year: year, days: 39)
            case .good_friday:
                return Holidays.Christian.getEasterDatePlusDays(isWestern: isWestern, year: year, days: -2)
            case .holy_saturday:
                return Holidays.Christian.getEasterDatePlusDays(isWestern: isWestern, year: year, days: -1)
            case .holy_tuesday:
                return Holidays.Christian.getEasterDatePlusDays(isWestern: isWestern, year: year, days: -5)
            case .halloween:
                return HolidayDate(year: year, month: .october, day: 31)
            case .immaculate_conception:
                return HolidayDate(year: year, month: .december, day: 8)
            case .mardi_gras:
                return Holidays.Christian.ash_wednesday.getDate(isWestern: isWestern, year: year)?.plus(.days(-1))
            case .palm_sunday:
                return Holidays.Christian.getEasterDatePlusDays(isWestern: isWestern, year: year, days: -7)
            case .pentecost:
                return Holidays.Christian.getEasterDatePlusDays(isWestern: isWestern, year: year, days: 7*7)
            case .saint_josephs_day:
                return HolidayDate(year: year, month: .march, day: 19)
            case .saint_patricks_day:
                return HolidayDate(year: year, month: .march, day: 17)
            case .valentines_day:
                return isWestern ? HolidayDate(year: year, month: .february, day: 14) : HolidayDate(year: year, month: .july, day: 6)
            case .whit_monday:
                return Holidays.Christian.getEasterDatePlusDays(isWestern: isWestern, year: year, days: 50)
            }
        }
        
        static func getEasterDate(isWestern: Bool, year: Int) -> HolidayDate {
            return isWestern ? getWesternEaster(year: year) : getEasternEaster(year: year)
        }
        static func getEasterDatePlusDays(isWestern: Bool, year: Int, days: Int) -> HolidayDate {
            let easter:HolidayDate = getEasterDate(isWestern: isWestern, year: year)
            return easter.plus(.days(days))
        }
        private static func getWesternEaster(year: Int) -> HolidayDate {
            let a:Int = year % 19, b:Int = year / 100, c:Int = year % 100, d:Int = b / 4, e:Int = b % 4
            let g:Int = ((8*b) + 13) / 25
            let h:Int = ((19*a) + b - d - g + 15) % 30
            let i:Int = c / 4, k = c % 4
            let l:Int = (32 + (2*e) + (2*i) - h - k) % 7
            let m:Int = (a + (11*h) + (19*l)) / 433;
            let month:Int = (h + l - (7*m) + 90) / 25
            let day:Int = (h + l - (7*m) + (33*month) + 19) % 32
            let gregorianMonth:Month = Month.init(rawValue: month)!
            return HolidayDate(year: year, month: gregorianMonth, day: day)
        }
        private static func getEasternEaster(year: Int) -> HolidayDate {
            let oldStyleDate:HolidayDate = getMeeusJulianEaster(year: year)
            return oldStyleDate.plus(.days(getDifferenceGregorianJulianDays(date: oldStyleDate)))
        }
        private static func getMeeusJulianEaster(year: Int) -> HolidayDate {
            let a:Int = year % 4, b:Int = year % 7, c:Int = year % 19
            let d:Int = ((19*c) + 15) % 30
            let e:Int = ((2*a) + (4*b) - d + 34) % 7
            let month:Int = (d + e + 114) / 31
            let day:Int = ((d + e + 114) % 31) + 1
            let julianMonth:Month = Month.init(rawValue: month)!
            return HolidayDate(year: year, month: julianMonth, day: day)
        }
        static func getDifferenceGregorianJulianDays(date: HolidayDate) -> Int {
            let components:DateComponents = date.components
            let year:Int = components.year!, day = components.day!
            let month:Month = Month.init(rawValue: components.month!)!
            let difference:Int = (year/100) - (year/400) - 2
            if year % 100 == 0 { // starting 15 October, 1582 | https://en.wikipedia.org/wiki/Gregorian_calendar
                switch month {
                case .january:
                    return difference-1
                case .february:
                    return day <= 28 ? difference-1 : difference
                default:
                    return difference
                }
            } else {
                return difference
            }
        }
    }
}
