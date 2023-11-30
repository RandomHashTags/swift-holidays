//
//  SocialHoliday.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

public extension Holidays {
    enum Social : String, Holiday {
        case africa_day
        case anzac_day
        case armed_forces_day
        case black_awareness_day
        case black_friday
        case boxing_day
        case constitution_day
        case cyber_monday
        case data_privacy_day
        case day_of_valor
        case emancipation_day
        case farmers_day
        case fathers_day
        
        case german_unity_day
        case groundhog_day
        
        case heroes_day
        case independence_day
        case international_workers_day
        case korean_alphabet_day
        case labour_day
        case labour_safety_day
        case may_day
        
        case national_day_of_spain
        
        case orange_shirt_day
        
        case liberation_day
        
        case martyrs_day
        case matariki
        
        case motherhood_and_beauty_day
        case mothers_day
        
        case national_cancer_survivors_day
        case national_science_day
        
        case queens_birthday
        
        case republic_day
        
        case teachers_day
        case thanksgiving
        
        case veterans_day
        case victory_day
        
        case waitangi_day
        
        public var type : HolidayType {
            return .countries
        }
        
        public var wikipedia_name : String? {
            switch self {
            case .black_friday: return "Black Friday (shopping)"
            case .korean_alphabet_day: return "Hangul Day"
            case .labour_safety_day: return "Labour Day"
            case .queens_birthday: return "Queen's Official Birthday"
            case .teachers_day: return "Teacher's Day"
            default: return getHoliday()?.wikipedia_name
            }
        }
        public var aliases : Set<String>? {
            switch self {
            case .black_awareness_day: return ["Black Consciousness Day", "Zumbi Day"]
            case .korean_alphabet_day: return ["Hangul Day", "Chosŏn'gŭl Day"]
            default: return getHoliday()?.aliases
            }
        }
        
        public func get_date(country: Country?, year: Int) -> HolidayDate? {
            if let holiday = getHoliday() {
                return holiday.get_date(country: country, year: year)
            }
            guard let country:Country = country else { return nil }
            switch self {
            case .black_awareness_day:
                switch country {
                case .brazil: return HolidayDate(year: year, month: .november, day: 20)
                default: return nil
                }
            case .black_friday:
                let thanksgiving:HolidayDate? = Holidays.Social.thanksgiving.get_date(country: Country.united_states, year: year)
                return thanksgiving?.plus(.days(1))
            case .cyber_monday:
                let blackFriday:HolidayDate? = Holidays.Social.black_friday.get_date(country: country, year: year)
                return blackFriday?.plus(.days(3))
            case .german_unity_day:
                switch country {
                case .germany:
                    return HolidayDate(year: year, month: .october, day: 3)
                default:
                    return nil
                }
            case .groundhog_day:
                switch country {
                case .canada, .united_states:
                    return HolidayDate(year: year, month: .february, day: 2)
                default:
                    return nil
                }
            case .orange_shirt_day:
                switch country {
                case .canada:
                    return HolidayDate(year: year, month: .september, day: 30)
                default:
                    return nil
                }
            case .korean_alphabet_day:
                switch country {
                case .north_korea: return HolidayDate(year: year, month: .january, day: 15)
                case .south_korea: return HolidayDate(year: year, month: .october, day: 9)
                default: return nil
                }
            case .labour_safety_day:
                switch country {
                case .bangladesh: return HolidayDate(year: year, month: .april, day: 24)
                default: return nil
                }
            case .matariki:
                switch country {
                case .new_zealand:
                    return nil // TODO: calculate this day!! (https://en.wikipedia.org/wiki/Matariki)
                default:
                    return nil
                }
            case .motherhood_and_beauty_day:
                switch country {
                case .armenia: return HolidayDate(year: year, month: .april, day: 7)
                default: return nil
                }
            case .national_cancer_survivors_day:
                switch country {
                case .antigua_and_barbuda, .united_states:
                    return HolidayDate.get_first(day_of_week: .sunday, month: .june, year: year)
                default:
                    return nil
                }
            case .national_day_of_spain:
                switch country {
                case .spain: return HolidayDate(year: year, month: .october, day: 12)
                default: return nil
                }
            case .waitangi_day:
                switch country {
                case .new_zealand: return HolidayDate(year: year, month: .february, day: 6)
                default: return nil
                }
            default:
                return nil
            }
        }
        
        public func get_sources(country: Country) -> EventSources {
            return getHoliday()?.get_sources(country: country) ?? default_sources
        }
        
        private func hasCustomHoliday() -> Bool {
            switch self {
            case .africa_day:
                return true
            default:
                return false
            }
        }
        
        private func getHoliday() -> (any CustomHoliday)? {
            switch self {
            case .africa_day: return AfricaDay.instance
            case .anzac_day: return AnzacDay.instance
            case .armed_forces_day: return ArmedForcesDay.instance
            case .boxing_day: return BoxingDay.instance
            case .constitution_day: return ConstitutionDay.instance
            case .data_privacy_day: return DataPrivacyDay.instance
            case .day_of_valor: return DayOfValor.instance
            case .emancipation_day: return EmancipationDay.instance
            case .farmers_day: return FarmersDay.instance
            case .fathers_day: return FathersDay.instance
            case .heroes_day: return HeroesDay.instance
            case .independence_day: return IndependenceDay.instance
            case .international_workers_day: return InternationalWorkersDay.instance
            case .labour_day: return LabourDay.instance
            case .liberation_day: return LiberationDay.instance
            case .martyrs_day: return MartyrsDay.instance
            case .may_day: return MayDay.instance
            case .mothers_day: return MothersDay.instance
            case .national_science_day: return NationalScienceDay.instance
            case .queens_birthday: return QueensBirthday.instance
            case .republic_day: return RepublicDay.instance
            case .teachers_day: return TeachersDay.instance
            case .thanksgiving: return Thanksgiving.instance
            case .veterans_day: return VeteransDay.instance
            case .victory_day: return VictoryDay.instance
            default: return nil
            }
        }
    }
}
