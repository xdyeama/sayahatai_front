//
//  IntroItem.swift
//  SayahatAIApp
//
//  Created by Beket Barlykov  on 05.07.2023.
//

import SwiftUI


struct IntroItem: Identifiable{
    let id = UUID()
    var title: String
    var subtitle: String
    var image: String
    var isEnd: Bool
}

var introItems: [IntroItem] = [
    IntroItem(title: "Chat with personal AI tour guide", subtitle: "Ask it any information", image: "intro_chatbot", isEnd: false),
    IntroItem(title: "Explore Kazakhstan", subtitle: "Like never before", image: "almaty_lake", isEnd: false),
    IntroItem(title: "Create your dream journey", subtitle: "using the latest AI technologies", image: "tourists", isEnd: true),
]
