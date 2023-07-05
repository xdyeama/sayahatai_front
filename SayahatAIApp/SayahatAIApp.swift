//
//  SayahatAIAppApp.swift
//  SayahatAIApp
//
//  Created by Beket Barlykov  on 01.07.2023.
//

import SwiftUI

@main
struct SayahatAIApp: App {
    @ObservedObject var onboardManager: OnboardManager = OnboardManager()
    @ObservedObject var tripsObject: TripsObject = TripsObject()
    @ObservedObject var inputModel: InputModel = InputModel()
    var body: some Scene {
        WindowGroup {
//            if onboardManager.isOnboarding{
//                IntroMainView()
//                    .environmentObject(onboardManager)
//            }
//            NavigationStack{
//                ContentView()
//                    .environmentObject(tripsObject)
//                    .environmentObject(inputModel)
//                    .environmentObject(onboardManager)
//            }
            IntroMainView()
        }
    }
}
