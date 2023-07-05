//
//  OnboardManager.swift
//  SayahatAIApp
//
//  Created by Beket Barlykov  on 05.07.2023.
//

import SwiftUI

class OnboardManager: ObservableObject {
    @Published var isOnboarding: Bool = AppDataAPI.isOnboarding
}
