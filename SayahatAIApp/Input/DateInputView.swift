//
//  DateInputView.swift
//  SayahatAIApp
//
//  Created by Beket Barlykov  on 03.07.2023.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}


struct DateInputForm: View{
    @Binding var inputDate: Date
    var placeholder: String
    
    var body: some View{
        HStack(){
            Text(placeholder)
            Image(systemName: "calendar")
                .frame(width: 23, height: 20)
            Divider()
            DatePicker(placeholder, selection: $inputDate, displayedComponents: .date)
                .datePickerStyle(.automatic)
                .labelsHidden()
                .textFieldStyle(PlainTextFieldStyle())
                .onTapGesture{
                    withAnimation {
                        UIApplication.shared.endEditing()
                    }
                }
        }.frame(width: 340)
    }
}
    
    
struct DateInputView: View {
    @State private var startDate = Date()
    @State private var endDate = Date()
    @EnvironmentObject var inputObject: InputModel
    var body: some View {
        VStack(alignment: .trailing, spacing: 77){
            Text("What dates are you planning to make a trip?")
                .font(
                    Font.custom("SF Pro", size: 22)
                        .weight(.medium)
                )
                .foregroundColor(Color(red: 0.09, green: 0.11, blue: 0.18))
                .frame(width: 320, height: 24, alignment: .topLeading)
            VStack(alignment: .trailing, spacing: 32){
                DateInputForm(inputDate: $startDate, placeholder: "Start date")
                DateInputForm(inputDate: $endDate, placeholder: "End date")
            }
            .frame(width: 340, height: 29)
            
            Button{
                inputObject.setStartDate(date: startDate)
                inputObject.setEndDate(date: endDate)
                
                print(inputObject.startDate!)
                print(inputObject.endDate!)
            }
            label:{
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 64, height: 64)
                        .background(Color(red: 0.2, green: 0.29, blue: 0.35))
                        .cornerRadius(64)
                    Image(systemName: "arrow.forward")
                        .frame(width: 32, height: 32)
                }
            }
            .frame(width: 64, height: 64)
        }.padding(.horizontal, 16)
    }
    
}


    
struct DateInputView_Previews: PreviewProvider {
    static var previews: some View {
        DateInputView()
    }
}
