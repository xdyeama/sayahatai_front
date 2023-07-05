//
//  InputModel.swift
//  SayahatAIApp
//
//  Created by Beket Barlykov  on 03.07.2023.
//

import Foundation


class InputModel: ObservableObject{
    @Published var cities: [CityCases] = []
    @Published var startDate: Date? = nil
    @Published var endDate: Date? = nil
    @Published var travelPreferences: [TravelPreferences] = []
    
//    init(cities: [CityCases], startDate: Date?, endDate: Date?, travelPreferences: [TravelPreferences]){
//        self.cities = cities
//        self.startDate = startDate
//        self.endDate = endDate
//        self.travelPreferences = travelPreferences
//    }
    
    func addCity(city: CityCases){
        !cities.contains(city) ? cities.append(city) : nil
    }
    
    func removeCity(city: CityCases){
        if let index = cities.firstIndex(of: city){
            cities.remove(at: index)
        }
    }
    
    func setStartDate(date: Date){
        startDate = date
    }
    
    func setEndDate(date: Date){
        endDate = date
    }
    
    func addTravelPreference(travelPref: TravelPreferences){
        !travelPreferences.contains(travelPref) ? travelPreferences.append(travelPref) : nil
    }
    
    func removeTravelPreference(travelPref: TravelPreferences){
        if let index = travelPreferences.firstIndex(of: travelPref){
            travelPreferences.remove(at: index)
        }
    }
    
    func generateTrip(){
        
    }
}
