//
//  IntroMainView.swift
//  SayahatAIApp
//
//  Created by Beket Barlykov  on 05.07.2023.
//

import SwiftUI



struct IntroMainView: View {
    var body: some View {
        VStack{
            TabView{
                ForEach(introItems, id: \.id){
                    item in
                    IntroItemView(title: item.title, subtitle: item.subtitle, image: item.image, isEnd: item.isEnd)
                }
            }
            .tabViewStyle(.page)
            .frame(height: 600)
        }
    }
}

struct IntroMainView_Previews: PreviewProvider {
    static var previews: some View {
        IntroMainView()
    }
}
