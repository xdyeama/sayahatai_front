//
//  ChatViewModel.swift
//  SayahatAI
//
//  Created by Beket Barlykov  on 09.06.2023.
//

import Foundation




struct CustomUser{
    static let property1 = 1
}


class ChatViewModel: ObservableObject{
    
    @Published var messages: [Int] = [1, 2, 3]
    
}
