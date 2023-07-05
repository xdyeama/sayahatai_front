//
//  ActivityDetailsView.swift
//  SayahatAIApp
//
//  Created by Beket Barlykov  on 03.07.2023.
//

import SwiftUI

struct ActivityDetailsView: View {
    var title: String
    var imageUrl: String
    var address: String
    var contactNumber: String
    var body: some View {
        VStack{
            Text(title)
              .font(
                Font.custom("SF Pro", size: 20)
                  .weight(.bold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(Color(red: 0, green: 0.09, blue: 0.2))
              .frame(width: 350, height: 21, alignment: .top)
            VStack{
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 343, height: 235)
                  .background(
                    Image(imageUrl)
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 343, height: 235)
                      .clipped()
                  )
                  .cornerRadius(6)
                VStack{
                    Text("Korean Restauraunt")
                      .font(
                        Font.custom("SF Pro", size: 14)
                          .weight(.medium)
                      )
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color(red: 0.23, green: 0.23, blue: 0.23).opacity(0.8))
                      .frame(width: 338, height: 24, alignment: .top)
                    Text("Address: \(address)")
                      .font(
                        Font.custom("SF Pro", size: 14)
                          .weight(.medium)
                      )
                      .foregroundColor(.black)
                      .frame(width: 338, height: 48, alignment: .topLeading)
                    Text("Phone number: \(contactNumber)")
                      .font(
                        Font.custom("SF Pro", size: 14)
                          .weight(.medium)
                      )
                      .foregroundColor(.black)
                }
                ZStack {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 134.54053, height: 38)
                      .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                      .cornerRadius(6)
                    Text("View on the map")
                      .font(
                        Font.custom("SF Pro", size: 14)
                          .weight(.bold)
                      )
                      .foregroundColor(.black)
                      .frame(width: 127.75675, height: 24, alignment: .topLeading)
                }
                .frame(width: 137, height: 38)
            }
            
        }
    }
}

struct ActivityDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailsView(title: "", imageUrl: "", address: "", contactNumber: "")
    }
}
