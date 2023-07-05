//
//  TravelPreferencesView.swift
//  SayahatAIApp
//
//  Created by Beket Barlykov  on 04.07.2023.
//

import SwiftUI

enum TravelPreferences: String, CaseIterable, Codable{
    case sightseeings
    case sport
    case culture
    case shopping
    case nature
}

struct TravelOption: View{
    @EnvironmentObject var inputObject: InputModel
    var travelCase: TravelPreferences
    @State var isSelected: Bool = false
    
    var body: some View{
        ZStack{
            if isSelected{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 140, height: 140)
                    .background(.white)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .inset(by: 0.5)
                            .stroke(.black.opacity(1), lineWidth: 1)
                    )
            }else{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 140, height: 140)
                    .background(.white)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 4)
            }
            VStack{
                Text(travelCase.rawValue)
                  .font(Font.custom("SF Pro", size: 20))
                  .multilineTextAlignment(.center)
                  .foregroundColor(.black)
                  .frame(width: 140, height: 25, alignment: .top)
                  .padding(.top, 8)
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 120, height: 95)
                  .background(
                    Image(travelCase.rawValue)
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                  )
                  .cornerRadius(20)
            }
        }.onTapGesture{
            !inputObject.travelPreferences.contains(travelCase)
                ? inputObject.addTravelPreference(travelPref: travelCase)
                : inputObject.removeTravelPreference(travelPref: travelCase)
            isSelected.toggle()
            print(inputObject.travelPreferences)
        }
    }
}

struct TravelPreferencesView: View {
    var body: some View {
        VStack(spacing: 16){
            Text("What aspects of the travel do you want to focus on?")
              .font(
                Font.custom("SF Pro", size: 20)
                  .weight(.medium)
              )
              .foregroundColor(Color(red: 0.09, green: 0.11, blue: 0.18))
              .frame(width: 340, height: 50, alignment: .center)
            LazyVGrid(columns:[GridItem(.fixed(140)), GridItem(.fixed(140))], alignment: .center, spacing: 8){
                ForEach(TravelPreferences.allCases, id: \.rawValue){
                    pref in
                    TravelOption(travelCase: pref)
                }
                
            }
            
            ZStack{
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 154, height: 50)
                  .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                  .cornerRadius(10)
                Text("Generate your trip")
                  .font(
                    Font.custom("SF Pro", size: 16)
                      .weight(.medium)
                  )
                  .foregroundColor(.black)
            }
        }.frame(width: 350)
    }
}

struct TravelPreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        TravelPreferencesView()
    }
}
