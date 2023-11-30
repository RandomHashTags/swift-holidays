//
//  HolidayDate.swift
//
//
//  Created by Evan Anderson on 11/30/23.
//

import Foundation

public struct HolidayDate : Hashable {
    static func get_first(day_of_week: DayOfWeek, month: Month, year: Int) -> HolidayDate? {
        return get(amount: 1, day_of_week: day_of_week, year: year, month: month, day: 1)
    }
    static func get_second(day_of_week: DayOfWeek, month: Month, year: Int) -> HolidayDate? {
        return get(amount: 2, day_of_week: day_of_week, year: year, month: month, day: 1)
    }
    static func get_third(day_of_week: DayOfWeek, month: Month, year: Int) -> HolidayDate? {
        return get(amount: 3, day_of_week: day_of_week, year: year, month: month, day: 1)
    }
    static func get_fourth(day_of_week: DayOfWeek, month: Month, year: Int) -> HolidayDate? {
        return get(amount: 4, day_of_week: day_of_week, year: year, month: month, day: 1)
    }
    static func get_last(day_of_week: DayOfWeek, month: Month, year: Int) -> HolidayDate? {
        return get(amount: 5, day_of_week: day_of_week, year: year, month: month, day: 1) ?? get_fourth(day_of_week: day_of_week, month: month, year: year)
    }
    static func get_first_after(day_of_week: DayOfWeek, year: Int, month: Month, day: Int) -> HolidayDate? {
        return get(amount: 1, day_of_week: day_of_week, year: year, month: month, day: day)
    }
    
    private static func get(amount: Int, day_of_week: DayOfWeek, year: Int, month: Month, day: Int) -> HolidayDate? {
        let calendar:Calendar = Calendar.current
        var startingComponents:DateComponents = DateComponents()
        startingComponents.month = month.rawValue
        startingComponents.year = year
        startingComponents.day = day
        guard let date:Date = calendar.date(from: startingComponents) else { return nil }
        
        let dayOfWeekValue:Int = day_of_week.rawValue, monthValue:Int = month.rawValue
        let startingDay:Int = amount == 1 ? 1 : (amount - 1) * 7, endingDay:Int = startingDay + 7
        for i in startingDay..<endingDay {
            let targetDate:Date = date.addingTimeInterval(.days(i))
            let components:DateComponents = calendar.dateComponents([.weekday, .month], from: targetDate)
            if dayOfWeekValue == components.weekday && monthValue == components.month {
                return HolidayDate(targetDate)
            }
        }
        return nil
    }
    
    public var components:DateComponents
    
    public init(year: Int, month: Month, day: Int) {
        self.init(year: year, month: month.rawValue, day: day)
    }
    public init(year: Int, month: Int, day: Int) {
        var components:DateComponents = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        self.components = components
    }
    
    public init(_ date: Date) {
        components = Calendar.current.dateComponents([.month, .year, .day], from: date)
    }
    public init(_ components: DateComponents) {
        self.components = components
    }
    
    public var date : Date {
        return Calendar.current.date(from: components)!
    }
    public func plus(_ timeInterval: TimeInterval) -> HolidayDate {
        let seconds:Int = Int(timeInterval)
        let newDate:Date = Calendar.current.date(byAdding: .second, value: seconds, to: date)!
        return HolidayDate(newDate)
    }
    
    public var first_weekday_after : HolidayDate {
        let date:Date = date
        switch date.day_of_week {
        case .friday:
            return HolidayDate(date.addingTimeInterval(.days(3)))
        case .saturday:
            return HolidayDate(date.addingTimeInterval(.days(2)))
        default:
            return HolidayDate(date.addingTimeInterval(.days(1)))
        }
    }
}

public enum Month : Int {
    case january = 1
    case february = 2
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
}

public enum DayOfWeek : Int, CaseIterable {
    case sunday = 1
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thursday = 5
    case friday = 6
    case saturday = 7
}

public extension Date {
    var day_of_week : DayOfWeek? {
        let component:Int = Calendar.current.component(.weekday, from: self)
        return DayOfWeek(rawValue: component)
    }
}

extension TimeInterval {
    static func minutes(_ input: Int) -> TimeInterval {
        return minutes(Double(input))
    }
    static func hours(_ input: Int) -> TimeInterval {
        return hours(Double(input))
    }
    static func days(_ input: Int) -> TimeInterval {
        return days(Double(input))
    }
    static func weeks(_ input: Int) -> TimeInterval {
        return weeks(Double(input))
    }
    static func months(_ input: Int) -> TimeInterval {
        return months(Double(input))
    }
    
    static func minutes(_ input: Double) -> TimeInterval {
        return input * 60
    }
    static func hours(_ input: Double) -> TimeInterval {
        return minutes(input) * 60
    }
    static func days(_ input: Double) -> TimeInterval {
        return hours(input) * 24
    }
    static func weeks(_ input: Double) -> TimeInterval {
        return days(input) * 7
    }
    static func months(_ input: Double) -> TimeInterval {
        return days(30.00) * input
    }
}
