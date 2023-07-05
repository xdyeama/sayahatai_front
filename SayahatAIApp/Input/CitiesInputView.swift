//
//  CitiesInputView.swift
//  SayahatAIApp
//
//  Created by Beket Barlykov  on 03.07.2023.
//

import SwiftUI

enum CityCases: String, CaseIterable, Codable{
    case almaty
    case astana
    case shymkent
    case aktobe
    case turkistan
    case aqtau
    case atyrau
    case semey
    case oskemen
    case karaganda
    case taldykorgan
    case pavlodar
    case taraz
    case uralsk
    case kyzylorda
    case kokshetau
    case kostanay
}
                



struct CityButton: View{
    var cityTitle: String
    var body: some View{
        ZStack{
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 85, height: 23)
              .background(Color(red: 0.2, green: 0.29, blue: 0.35))
              .cornerRadius(10)
            Text(cityTitle)
              .font(Font.custom("SF Pro", size: 14))
              .foregroundColor(.white)
              .frame(width: .infinity)
        }
        .frame(width: 85, height: 27)
    }
}

struct CityOption: View{
    @EnvironmentObject var inputObject: InputModel
    var city: CityCases
    @State var isSelected: Bool = false
    @Binding var citiesList: [CityCases]
    
    var body: some View{
        ZStack {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 144.60976, height: 154)
              .background(
                Image(city.rawValue)
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 154, height: 154)
                  .clipped()
              )
              .cornerRadius(15)
              .overlay(isSelected == true ?
                    RoundedRectangle(cornerRadius: 15)
                        .inset(by: 1)
                        .stroke(Color(red: 0, green: 1, blue: 0.1), lineWidth: 2) : nil
              )
            
            Text(city.rawValue.uppercased())
              .font(
                Font.custom("DM Sans", size: 14)
                  .weight(.medium)
              )
              .foregroundColor(.white)
              .frame(width: 48.82927, height: 17.84146, alignment: .topLeading)
        }
        .frame(width: 154, height: 154)
        .onTapGesture{
            !inputObject.cities.contains(city) ? inputObject.addCity(city: city) : inputObject.removeCity(city: city)
            isSelected.toggle()
            print(inputObject.cities)
        }
    }
}

struct CitiesInputForm: View{
    @EnvironmentObject var inputObject: InputModel
    let gridColumns = [
        GridItem(.flexible()), GridItem(.flexible())
    ]
    
    @Binding var citiesList: [CityCases]
    var body: some View{
        ScrollView{
            LazyVGrid(columns: gridColumns, spacing: 16){
                ForEach(CityCases.allCases, id: \.rawValue){
                    city in
                    CityOption(city: city, citiesList: $citiesList)
                }
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 0)
        .padding(.top, 34)
        .frame(width: 379, height: 692, alignment: .top)
        .background(Color(red: 0.2, green: 0.29, blue: 0.35))
        .cornerRadius(25)
    }
}

struct CitiesInputView: View {
    @State var citiesList: [CityCases] = []
    @State var isExpanded: Bool = false
    var body: some View {
        if isExpanded{
            CitiesInputForm(citiesList: $citiesList)
                .padding(0)
                .transition(
                    .move(edge:.top)
                )
        }else{
            VStack{
                Text("What cities do you plan to visit?")
                    .font(
                        Font.custom("SF Pro", size: 22)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.09, green: 0.11, blue: 0.18))
                    .frame(width: 319, height: 24, alignment: .topLeading)
                VStack{
                    Text("Choose cities you are willing to visit")
                        .font(Font.custom("Poppins", size: 14))
                        .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.67))
                        .frame(width: 262, height: 27, alignment: .topLeading)
                    ZStack {
                        HStack{
                            ForEach(citiesList, id: \.rawValue){
                                city in
                                CityButton(cityTitle: city.rawValue)
                            }
                        }
                        Rectangle()
                            .frame(width: 300, height: 2)
                            .foregroundColor(Color(.gray))
                        
                    }
                    .frame(width: 293, height: 57)
                    .onTapGesture{
                        isExpanded.toggle()
                    }
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 64, height: 64)
                        .background(Color(red: 0.2, green: 0.29, blue: 0.35))
                        .cornerRadius(64)
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                        .frame(width: 32, height: 32)
                        .aspectRatio(contentMode: .fill)
                }
                .frame(width: 64, height: 64)
            }
        }
    }
}

struct CitiesInputView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesInputView()
    }
}
