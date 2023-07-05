//
//  ContentView.swift
//  SayahatAIApp
//
//  Created by Beket Barlykov  on 01.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab: Tab = .bag
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        ZStack{
            VStack{
                TabView(selection: $selectedTab){
                    TripsView().tag(Tab.bag)
                    MapView().tag(Tab.map)
                    ChatView().tag(Tab.message)
                    AccountView().tag(Tab.person)
                }
            }
            VStack{
                Spacer()
                MainTabView(selectedTab: $selectedTab)
            }
        }.padding(0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
