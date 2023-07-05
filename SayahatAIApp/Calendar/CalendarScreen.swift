//
//  CalendarScreen.swift
//  SayahatAI
//
//  Created by Beket Barlykov  on 09.06.2023.
//

import SwiftUI

struct CalendarScreen: View {
    @State var currentDate: Date = Date()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 20){
                CustomDatePicker(currentDate: $currentDate)
            }
            .padding(.vertical)
            
        }
        .safeAreaInset(edge: .bottom){
            HStack{
                Button{
                    
                } label: {
                    Text("Add Task")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(CustomColors.text, in: Capsule())
                }
                
                Button{
                    
                } label: {
                    Text("Add Remainder")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(CustomColors.background, in: Capsule())
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)
            .foregroundColor(.white)
            .background(.ultraThinMaterial)
        }
    }
}

struct CalendarScreen_Previews: PreviewProvider {
    static var previews: some View {
        CalendarScreen()
    }
}
