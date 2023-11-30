//
//  UnitedNationsHoliday.swift
//  
//
//  Created by Evan Anderson on 6/23/22.
//

import Foundation
import SwiftSovereignStates

public extension Holidays {
    enum UnitedNations : String, Holiday { // https://en.wikipedia.org/wiki/Category:United_Nations_days
        case asteroid_day
        
        case earth_day
        
        case global_day_of_parents
        case global_handwashing_day
        
        case human_rights_day
        
        case international_albinism_awareness_day
        case international_anti_corruption_day
        case international_chernobyl_disaster_remembrance_day
        case international_cooperative_day
        case international_dance_day
        case international_day_for_the_abolition_of_slavery
        case international_day_for_the_preservation_of_the_ozone_layer
        case international_day_of_democracy
        case international_day_of_education
        case international_day_of_families
        case international_day_of_forests
        case international_day_of_happiness
        case international_day_of_human_space_flight
        case international_day_of_light
        case international_day_of_peace
        case international_day_of_the_worlds_indigenous_peoples
        case international_day_of_women_and_girls_in_science
        case international_day_of_yoga
        case international_firefighters_day
        case international_holocaust_remembrance_day
        case international_human_solidarity_day
        case international_literacy_day
        case international_mother_earth_day
        case international_nurses_day
        case international_volunteer_day
        case international_widows_day
        case international_womens_day
        case international_youth_day
        
        case national_cleanup_day
        case national_world_book_day
        
        case united_nations_day
        
        case world_aids_day
        case world_autism_day
        case world_bee_day
        case world_bicycle_day
        case world_blood_donor_day
        case world_braille_day
        case world_cancer_day
        case world_cities_day
        case world_creativity_and_innovation_day
        case world_day_against_child_labour
        case world_day_of_remembrance_for_road_traffic_victims
        case world_day_to_combat_desertification_and_drought
        case world_development_information_day
        case world_down_syndrome_day
        case world_environment_day
        case world_food_day
        case world_habitat_day
        case world_health_day
        case world_hepatitis_day
        case world_humanitarian_day
        case world_logic_day
        case world_malaria_day
        case world_meteorological_day
        case world_milk_day
        case world_no_tobacco_day
        case world_oceans_day
        case world_patient_safety_day
        case world_philosophy_day
        case world_poetry_day
        case world_population_day
        case world_press_freedom_day
        case world_radio_day
        case world_refugee_day
        case world_students_day
        case world_telecommunication_and_information_society_day
        case world_television_day
        case world_toilet_day
        case world_tourism_day
        case world_tuberculosis_day
        case world_water_day
        case world_wildlife_day
        
        case zero_discrimination_day
        
        case arabic_language_day
        case chinese_language_day
        case english_language_day
        case spanish_language_day
        case french_language_day
        case russian_language_day
        
        public var type : HolidayType {
            return .united_nations
        }
        
        public var wikipedia_name : String? {
            switch self {
            case .global_day_of_parents: return "Parent's Day"
            case .international_anti_corruption_day: return "International Anti-Corruption Day"
            case .international_cooperative_day: return "International Co-operative Day"
            case .international_day_of_the_worlds_indigenous_peoples: return "International Day of the World's Indigenous Peoples"
            case .international_firefighters_day: return "International Firefighters' Day"
            case .international_womens_day: return "International Women's Day"
            case .national_cleanup_day: return "National CleanUp Day"
            case .national_world_book_day: return "World Book Day"
            case .world_aids_day: return "World AIDS Day"
            case .world_students_day: return "World Students' Day"
            default: return nil
            }
        }
        
        public var aliases : Set<String>? {
            switch self {
            case .asteroid_day: return ["International Asteroid Day"]
            case .international_albinism_awareness_day: return ["IAAD"]
            case .international_day_of_light: return ["Light Day"]
            case .international_firefighters_day: return ["IFFD"]
            default: return nil
            }
        }
        
        public func get_date(country: Country?, year: Int) -> HolidayDate? {
            guard country != nil && (country!.is_united_nations_member || country!.is_united_nations_observer_state) else { return nil }
            
            switch self {
            case .asteroid_day: return HolidayDate(year: year, month: .june, day: 30)
            case .earth_day,
                    .international_mother_earth_day:
                return HolidayDate(year: year, month: .april, day: 22)
            case .global_day_of_parents: return HolidayDate(year: year, month: .june, day: 1)
            case .global_handwashing_day: return HolidayDate(year: year, month: .october, day: 15)
            case .human_rights_day: return HolidayDate(year: year, month: .december, day: 10)
            case .international_albinism_awareness_day: return HolidayDate(year: year, month: .june, day: 13)
            case .international_anti_corruption_day: return HolidayDate(year: year, month: .december, day: 9)
            case .international_chernobyl_disaster_remembrance_day: return HolidayDate(year: year, month: .april, day: 26)
            case .international_cooperative_day: return HolidayDate.get_first(day_of_week: .saturday, month: .july, year: year)
            case .international_dance_day: return HolidayDate(year: year, month: .april, day: 29)
            case .international_day_for_the_abolition_of_slavery: return HolidayDate(year: year, month: .december, day: 2)
            case .international_day_for_the_preservation_of_the_ozone_layer: return HolidayDate(year: year, month: .september, day: 16)
            case .international_day_of_democracy: return HolidayDate(year: year, month: .september, day: 15)
            case .international_day_of_education: return HolidayDate(year: year, month: .january, day: 24)
            case .international_day_of_families: return HolidayDate(year: year, month: .may, day: 15)
            case .international_day_of_forests,
                    .world_down_syndrome_day:
                return HolidayDate(year: year, month: .march, day: 21)
            case .international_day_of_happiness: return HolidayDate(year: year, month: .march, day: 20)
            case .international_day_of_human_space_flight: return HolidayDate(year: year, month: .april, day: 12)
            case .international_day_of_light: return HolidayDate(year: year, month: .may, day: 16)
            case .international_day_of_peace: return HolidayDate(year: year, month: .september, day: 21)
            case .international_day_of_the_worlds_indigenous_peoples: return HolidayDate(year: year, month: .august, day: 9)
            case .international_day_of_women_and_girls_in_science: return HolidayDate(year: year, month: .february, day: 11)
            case .international_day_of_yoga: return HolidayDate(year: year, month: .june, day: 21)
            case .international_firefighters_day: return HolidayDate(year: year, month: .may, day: 4)
            case .international_holocaust_remembrance_day: return HolidayDate(year: year, month: .january, day: 27)
            case .international_human_solidarity_day: return HolidayDate(year: year, month: .december, day: 20)
            case .international_literacy_day: return HolidayDate(year: year, month: .september, day: 8)
                
            case .international_nurses_day: return HolidayDate(year: year, month: .may, day: 12)
            case .international_volunteer_day: return HolidayDate(year: year, month: .december, day: 5)
            case .international_widows_day: return HolidayDate(year: year, month: .june, day: 23)
            case .international_womens_day: return HolidayDate(year: year, month: .march, day: 8)
            case .international_youth_day: return HolidayDate(year: year, month: .august, day: 12)
            case .national_cleanup_day: return HolidayDate.get_third(day_of_week: .saturday, month: .september, year: year)
            case .national_world_book_day: return HolidayDate(year: year, month: .april, day: 23)
            case .united_nations_day,
                    .world_development_information_day:
                return HolidayDate(year: year, month: .october, day: 24)
            case .world_aids_day: return HolidayDate(year: year, month: .december, day: 1)
            case .world_autism_day: return HolidayDate(year: year, month: .april, day: 2)
            case .world_bee_day: return HolidayDate(year: year, month: .may, day: 20)
            case .world_bicycle_day: return HolidayDate(year: year, month: .june, day: 3)
            case .world_blood_donor_day: return HolidayDate(year: year, month: .june, day: 14)
            case .world_braille_day: return HolidayDate(year: year, month: .january, day: 4)
            case .world_cancer_day: return HolidayDate(year: year, month: .february, day: 4)
            case .world_cities_day: return HolidayDate(year: year, month: .october, day: 31)
            case .world_creativity_and_innovation_day: return HolidayDate(year: year, month: .april, day: 21)
            case .world_day_against_child_labour: return HolidayDate(year: year, month: .june, day: 12)
            case .world_day_of_remembrance_for_road_traffic_victims: return HolidayDate.get_third(day_of_week: .sunday, month: .november, year: year)
            case .world_day_to_combat_desertification_and_drought: return HolidayDate(year: year, month: .june, day: 17)
            case .world_environment_day: return HolidayDate(year: year, month: .june, day: 5)
            case .world_food_day: return HolidayDate(year: year, month: .october, day: 16)
            case .world_habitat_day: return HolidayDate.get_first(day_of_week: .monday, month: .october, year: year)
            case .world_health_day: return HolidayDate(year: year, month: .april, day: 7)
            case .world_hepatitis_day: return HolidayDate(year: year, month: .july, day: 28)
            case .world_humanitarian_day: return HolidayDate(year: year, month: .august, day: 19)
            case .world_logic_day: return HolidayDate(year: year, month: .january, day: 14)
            case .world_malaria_day: return HolidayDate(year: year, month: .april, day: 25)
            case .world_meteorological_day: return HolidayDate(year: year, month: .march, day: 23)
            case .world_milk_day: return HolidayDate(year: year, month: .june, day: 1)
            case .world_no_tobacco_day: return HolidayDate(year: year, month: .may, day: 31)
            case .world_oceans_day: return HolidayDate(year: year, month: .june, day: 8)
            case .world_patient_safety_day: return HolidayDate(year: year, month: .september, day: 17)
            case .world_philosophy_day: return HolidayDate.get_third(day_of_week: .thursday, month: .november, year: year)
            case .world_poetry_day: return HolidayDate(year: year, month: .march, day: 21)
            case .world_population_day: return HolidayDate(year: year, month: .july, day: 22)
            case .world_press_freedom_day: return HolidayDate(year: year, month: .may, day: 3)
            case .world_radio_day: return HolidayDate(year: year, month: .february, day: 13)
            case .world_refugee_day: return HolidayDate(year: year, month: .june, day: 20)
            case .world_students_day: return HolidayDate(year: year, month: .october, day: 15)
            case .world_telecommunication_and_information_society_day: return HolidayDate(year: year, month: .may, day: 17)
            case .world_television_day: return HolidayDate(year: year, month: .november, day: 21)
            case .world_toilet_day: return HolidayDate(year: year, month: .november, day: 19)
            case .world_tourism_day: return HolidayDate(year: year, month: .september, day: 27)
            case .world_tuberculosis_day: return HolidayDate(year: year, month: .march, day: 24)
            case .world_water_day: return HolidayDate(year: year, month: .march, day: 22)
            case .world_wildlife_day: return HolidayDate(year: year, month: .march, day: 3)
                
            case .zero_discrimination_day: return HolidayDate(year: year, month: .march, day: 1)
                
            case .arabic_language_day: return HolidayDate(year: year, month: .december, day: 18)
            case .chinese_language_day: return HolidayDate(year: year, month: .april, day: 20)
            case .english_language_day: return HolidayDate(year: year, month: .april, day: 23)
            case .spanish_language_day: return HolidayDate(year: year, month: .april, day: 23)
            case .french_language_day: return HolidayDate(year: year, month: .march, day: 20)
            case .russian_language_day: return HolidayDate(year: year, month: .june, day: 6)
            }
        }
        
        
        public func get_sources(country: Country) -> EventSources {
            let unitedNations:String = "United Nations: " + name
            switch self {
            case .international_day_of_light:
                return EventSources(sources: [EventSource(name: "Official Website", url: "https://www.lightday.org")])
            case .arabic_language_day:
                return EventSources(sources: [EventSource(name: unitedNations, url: "https://www.un.org/ar/observances/arabiclanguageday/")])
            case .chinese_language_day:
                return EventSources(sources: [EventSource(name: unitedNations, url: "https://www.un.org/zh/observances/chinese-language-day")])
            case .english_language_day:
                return EventSources(sources: [EventSource(name: unitedNations, url: "https://www.un.org/en/observances/english-language-day")])
            case .spanish_language_day:
                return EventSources(sources: [EventSource(name: unitedNations, url: "https://www.un.org/es/observances/spanish-language-day")])
            case .french_language_day:
                return EventSources(sources: [EventSource(name: unitedNations, url: "https://www.un.org/fr/observances/french-language-day/")])
            case .russian_language_day:
                return EventSources(sources: [EventSource(name: unitedNations, url: "https://www.un.org/ru/observances/russian-language-day")])
            default:
                return default_sources
            }
        }
    }
}
