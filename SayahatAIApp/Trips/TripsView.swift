//
//  TripsView.swift
//  SayahatAI
//
//  Created by Beket Barlykov  on 16.06.2023.
//

import SwiftUI

struct TripsView: View {
    @EnvironmentObject var tripsObject: TripsObject
    
    var body: some View {
        
        VStack(){
            Text("Your tours")
                .font(
                    Font.custom("SF Pro", size: 24)
                        .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0, green: 0.09, blue: 0.2))
                .padding(30)
            Spacer()
            if tripsObject.trips == []{
                VStack(alignment: .center){
                    Text("You have no tours planned")
                        .font(
                            Font.custom("SF Pro", size: 36)
                                .weight(.bold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 157.12762, height: 38)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .cornerRadius(6)
                        Text("Create new tour")
                            .font(
                                Font.custom("SF Pro", size: 16)
                                    .weight(.medium)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 149.20497, height: 24, alignment: .top)
                    }
                    .frame(width: 157.12762, height: 38)
                    .padding(30)
                    
                }
                Spacer()
            }else{
                    VStack(alignment: .center, spacing: 10) {
                        ForEach(tripsObject.trips, id: \.id){
                            trip in
                            NavigationLink(value: trip){
                                TripView(tripId: trip.id, tripName: trip.title, tripTags: trip.tags ,tripImageUrl: trip.imageUrl, userImageUrl: trip.userImageUrl, userName: trip.userName)
                            }.navigationDestination(for: TripModel.self){ tripModel in
                                DaysPlanView(dayPlans: tripModel.dayPlans)
                            }
                    }
                    .padding(0)
                }
            }
        }
        .frame(width: 375, height: 812)
        .background(.white)
    }
}

struct TripView: View{
    let tripId: String
    let tripName: String
    let tripTags: [String]
    let tripImageUrl: String
    let userImageUrl: String
    let userName: String
    var body: some View{
        VStack(alignment: .leading, spacing: 4) {
            ZStack (alignment: .bottomLeading){
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 344, height: 212)
                    .background(
                        Image(tripImageUrl)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 344, height: 212)
                        .clipped()
                    ).cornerRadius(16)
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 83, height: 27)
                        .background(Color(red: 1, green: 0.96, blue: 0.62))
                        .cornerRadius(16)
                    HStack(spacing: 0){
                        Image(systemName:"mappin")
                        Text("11 places")
                            .font(Font.custom("SF Pro", size: 14).weight(.medium))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black).padding(0)
                    }
                }
                .frame(width: 83, height: 27)
                .padding(5)
            }
            .frame(width: 344, height: 212)
        
            HStack(alignment: .center, spacing: 2) {
                
                
                    ForEach(tripTags, id:\.self){
                        tripTag in
                        ZStack {
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 47, height: 18)
                            .background(Color(red: 0.98, green: 0.66, blue: 0.35))
                            .cornerRadius(16)
                        Text(tripTag)
                            .font(Font.custom("SF Pro", size: 10))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                        
                    }

                }
                .frame(width: 47, height: 18)

            }
            .padding(0)
            Text(tripName)
              .font(
                Font.custom("SF Pro", size: 16)
                  .weight(.bold)
              )
              .foregroundColor(.black)
              .frame(width: 341, height: 19, alignment: .topLeading)
            HStack(alignment: .top, spacing: 4) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 24, height: 24)
                    .background(
                        Image(userImageUrl)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 24, height: 24)
                            .clipped()
                    )
                    .cornerRadius(24)
                Text(userName)
                    .font(Font.custom("SF Pro", size: 12))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
            .padding(0)
            .frame(width: 112, alignment: .topLeading)
        }
        .padding(.horizontal, 4)
        .padding(.vertical, 0)
        .frame(height: 300, alignment: .topLeading)
        .background(.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
    }
}

struct TripsView_Previews: PreviewProvider {

    static var previews: some View {
        return TripsView().environmentObject(TripsObject())
    }
}
