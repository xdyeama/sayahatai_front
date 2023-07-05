//
//  DaysPlanView.swift
//  SayahatAIApp
//
//  Created by Beket Barlykov  on 02.07.2023.
//

import SwiftUI

struct ActivityView: View{
    var activityName: String
    var activityImageUrl: String
    var activityType: String
    var body: some View{
        HStack(alignment: .top, spacing: 4) {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 166, height: 95)
              .background(
                Image(activityImageUrl)
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 166, height: 95)
                  .clipped()
              )
              .cornerRadius(4)
            VStack(alignment: .leading, spacing: 4) {
                Text(activityName)
                  .font(
                    Font.custom("SF Pro", size: 15)
                      .weight(.bold)
                  )
                  .foregroundColor(Color(red: 0.04, green: 0.02, blue: 0.11))
                  .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                Text(activityType)
                  .font(
                    Font.custom("SF Pro", size: 10)
                      .weight(.bold)
                  )
                  .kerning(0.5)
                  .foregroundColor(Color(red: 0.23, green: 0.23, blue: 0.23))
                  .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
            .padding(0)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .padding(.leading, 0)
        .padding(.trailing, 8)
        .padding(.vertical, 0)
        .frame(width: 343, height: 95, alignment: .topLeading)
        .background(.white)
        .cornerRadius(22)
        .shadow(color: .black.opacity(0.15), radius: 25, x: 12, y: 26)
    }
}

struct DaysPlanView: View {
    var dayPlans: [DayPlanModel]
//    [
//        DayPlanModel(dayNum: 1, city: "Almaty", activities: [
//            ActivityModel(title: "Wamboo", type: "Breakfast", imageUrl: "wamboo", time: "9:00 PM", address: "Kabanbay Batyr Ave 47, Almaty 050000, Kazakhstan'", contacts: "8 (7172) 70 70 70"),
//            ActivityModel(title: "Adam Restaurante", type: "Lunch", imageUrl: "adam", time: "13:00 PM", address: "Kabanbay Batyr Ave 47, Almaty 050000, Kazakhstan'", contacts: "8 (772) 70 70 70")
//        ]),
//        DayPlanModel(dayNum: 2, city: "Astana", activities: [
//            ActivityModel(title: "Kishlak Restaurant", type: "Breakfast", imageUrl: "kishlak", time: "9:00 PM", address: "Buhar Zhyrau 12, Astana 0100000, Kazakhstan", contacts: "8 (7172) 70 70 70")])
//    ]
    var body: some View {
        VStack(){
            Text("Kazakhstan tour 1")
              .font(
                Font.custom("SF Pro", size: 20)
                    .weight(.black)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(Color(red: 0, green: 0.09, blue: 0.2))
            HStack(spacing: 6) {
                ZStack {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 73, height: 23)
                      .background(Color(red: 0.22, green: 0.7, blue: 1))
                      .cornerRadius(10)
                    Text("Overall")
                      .font(Font.custom("SF Pro", size: 12))
                      .multilineTextAlignment(.center)
                      .foregroundColor(.white)
                      .frame(width: 42.94118, height: 23, alignment: .center)
                }
                .frame(width: 73, height: 23)
                ZStack {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 58, height: 23)
                      .background(Color(red: 0.2, green: 0.29, blue: 0.35))
                      .cornerRadius(10)
                    Text("Day 1")
                      .font(Font.custom("SF Pro", size: 12))
                      .multilineTextAlignment(.center)
                      .foregroundColor(.white)
                      .frame(width: 34.11765, height: 23, alignment: .center)
                }
                .frame(width: 58, height: 23)
            }
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 343, height: 1)
              .background(Color(red: 0.23, green: 0.23, blue: 0.23))
            .padding(0)
            VStack(alignment: .leading, spacing: 12) {
                ForEach(dayPlans, id: \.dayNum){
                    dayPlan in
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Day \(dayPlan.dayNum) - \(dayPlan.city)")
                            .font(
                                Font.custom("SF Pro", size: 16)
                                    .weight(.medium))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0, green: 0.09, blue: 0.2))
                                .frame(width: 350, height: 21, alignment: .top)
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(dayPlan.activities, id: \.title){
                                activity in
                                ActivityView(activityName: activity.title, activityImageUrl: activity.imageUrl, activityType: activity.type)
                            }
                        }
                        .padding(0)
                        .frame(width: 358, height: nil, alignment: .topLeading)
                    }
                }
                .padding(0)
                .frame(width: 343, alignment: .topLeading)
            }
            .padding(0)
            .frame(height: 338, alignment: .topLeading)
            Spacer()
        }
    }
}

struct DaysPlanView_Previews: PreviewProvider {
    static var previews: some View {
        DaysPlanView(dayPlans:[])
    }
}
