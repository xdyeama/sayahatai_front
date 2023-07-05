//
//  TripMdeol.swift
//  SayahatAI
//
//  Created by Beket Barlykov  on 16.06.2023.
//

import Foundation


struct ActivityModel: Hashable, Codable{
    let title: String
    let type: String
    let imageUrl: String
    let time: String
    let address: String
    let contacts: String
}

struct DayPlanModel: Hashable, Codable{
    let dayNum: Int
    let city: String
    let activities: [ActivityModel]
}

struct TripModel: Hashable, Codable{
    let id: String
    let title: String
    let tags: [String]
    let imageUrl: String
    let userImageUrl: String
    let userName: String
    let dayPlans: [DayPlanModel]
}


class TripsObject: ObservableObject{
    @Published var trips: [TripModel] =
    [
        TripModel(
            id: "649ba5fd4e694b0d12ad20ee",
            title: "Tour around Astana",
            tags: ["Food", "Culture"],
            imageUrl: "astana_tour",
            userImageUrl: "user_logo",
            userName: "Beket Barlykov",
            dayPlans:  [
                DayPlanModel(dayNum: 1, city: "Almaty", activities: [
                    ActivityModel(title: "Wamboo", type: "Breakfast", imageUrl: "wamboo", time: "9:00 PM", address: "Kabanbay Batyr Ave 47, Almaty 050000, Kazakhstan'", contacts: "8 (7172) 70 70 70"),
                    ActivityModel(title: "Adam Restaurante", type: "Lunch", imageUrl: "adam", time: "13:00 PM", address: "Kabanbay Batyr Ave 47, Almaty 050000, Kazakhstan'", contacts: "8 (772) 70 70 70")
                ]),
                DayPlanModel(dayNum: 2, city: "Astana", activities: [
                    ActivityModel(title: "Kishlak Restaurant", type: "Breakfast", imageUrl: "kishlak", time: "9:00 PM", address: "Buhar Zhyrau 12, Astana 0100000, Kazakhstan", contacts: "8 (7172) 70 70 70")])
            ]
        ),
        TripModel(
            id: "649ba82598c7741bc15a24eb",
            title: "Tour around Almaty",
            tags: ["Food", "Culture", "Shopping"],
            imageUrl: "almaty_tour",
            userImageUrl: "user_logo",
            userName: "Beket Barlykov",
            dayPlans:  [
                DayPlanModel(
                    dayNum: 1,
                    city: "Astana",
                    activities: [
                        ActivityModel(title: "Almaty Arena", type: "Sport", imageUrl: "almaty_arena",time: "9:00 PM", address: "Kabanbay Batyr Ave 47, Astana 010000, Kazakhstan'", contacts: "8 (7172) 70 70 70")
                    ]
                )
            ]
        )]
//
    func fetch(){
        
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){
            [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let trips = try JSONDecoder().decode([TripModel].self, from: data)
                
                DispatchQueue.main.async{
                    self?.trips = trips
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
        
    }
}
