//
//  IntroItemView.swift
//  SayahatAIApp
//
//  Created by Beket Barlykov  on 05.07.2023.
//

import SwiftUI

struct NextButton: View{
    var body: some View{
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
    }
}

struct IntroItemView: View {
    var title: String
    var subtitle: String
    var image: String
    var isEnd: Bool
    
    var body: some View {
        VStack(spacing: 10){
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 375, height: 323)
              .background(
                Image(image)
                  .resizable()
                  .aspectRatio(contentMode: .fit)
              )
            VStack(spacing: 0){
                Text(title)
                  .font(Font.custom("SF Pro", size: 28))
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color(red: 0.09, green: 0.11, blue: 0.18))
                  .frame(width: 316, alignment: .top)
                Text(subtitle)
                  .font(Font.custom("SF Pro", size: 18))
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.67))
                  .frame(width: 256, height: 20, alignment: .top)
            }
            isEnd ? NextButton() : nil
        }
    }
}

struct IntroItemView_Previews: PreviewProvider {
    static var previews: some View {
        IntroItemView(title: "Chat with personal AI tour guide", subtitle: "Ask it any information", image: "intro_chatbot", isEnd: false)
    }
}
