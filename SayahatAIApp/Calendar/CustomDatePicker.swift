//
//  CustomDatePicker.swift
//  SayahatAI
//
//  Created by Beket Barlykov  on 09.06.2023.
//

import SwiftUI
import Foundation
import Combine

struct CustomDatePicker: View {
    @Binding var currentDate: Date
    
    @State var currentMonth: Int = 5
    
    var body: some View {
        VStack(spacing: 35){
            
            let days: [String] = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
            
            // Year - month view
            HStack(spacing: 20){
                VStack(alignment: .leading, spacing: 10){
                    Text(extraData()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(CustomColors.text)
                    Text(extraData()[1])
                        .fontWeight(.semibold)
                        .foregroundColor(CustomColors.text)
                }
                Spacer(minLength: 0)
                
                Button{
                    withAnimation{
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Button{
                    withAnimation{
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }.padding(.horizontal)
            
            // Weekday view
            HStack(spacing: 0){
                ForEach(days, id: \.self){ day in
                    Text(day).font(.callout).fontWeight(.semibold)
                        .frame(maxWidth: .infinity).foregroundColor(CustomColors.text)
                    
                }
            }
            
            // Dates
            // LazyGrid
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 15){
                ForEach(extractDate()){ value in
                    CardView(value: value)
                        .background(
                            Capsule()
                                .fill(CustomColors.container)
                                .padding(.horizontal, 8)
                                .opacity(isSameDate(date1: value.date, date2: currentDate) ? 1 : 0)
                        )
                        .onTapGesture{
                            currentDate = value.date
                        }
                }
            }
            
            VStack(spacing: 15){
                Text("Tasks")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 10)
                
                if let task = tasks.first(where: {
                    task in
                    return isSameDate(date1: task.taskDate, date2: currentDate)
                }){
                    ForEach(task.tasks){task in
                        VStack(alignment: .leading, spacing: 10){
                            Text(task.time.addingTimeInterval(CGFloat.random(in: 0...5000)), style: .time)
                            
                            Text(task.title)
                                .font(.title2.bold())
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            CustomColors.background
                                .opacity(0.5)
                                .cornerRadius(10)
                        )
                        
                    }
                }else{
                    Text("No Task Found")
                }
            }.padding()
            
        }.onChange(of: currentMonth){ newValue in
            
            currentDate = getCurrentMonth()
            
        }
    }
    
    @ViewBuilder
    func CardView(value: DateModel) -> some View{
        VStack{
            if value.day != -1{
                if let task = tasks.first(where: {task in
                    
                    return isSameDate(date1: task.taskDate, date2: value.date)
                }){
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDate(date1: task.taskDate, date2: currentDate) ? .white :
                                .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    Circle()
                        .fill(isSameDate(date1: task.taskDate, date2: currentDate) ? .white :
                                CustomColors.button )
                        .frame(width: 8, height: 8)
                }else{
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDate(date1: value.date, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
            }
        }.padding(.vertical, 9).frame(height: 60, alignment: .top)
    }
    
    func isSameDate(date1: Date, date2: Date)->Bool{
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    func extraData() -> [String]{
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth() -> Date{
        let calendar = Calendar.current
        
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else{
            return Date()
        }
        
        return currentMonth
    }
    
    func extractDate() -> [DateModel]{
        let calendar = Calendar.current
        
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap { date -> DateModel in
            
            // Getting current day
            let day = calendar.component(.day, from: date)
            
            return DateModel(day: day, date: date)
        }
        
        //adding ofset days to get matching weekdays
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1{
            days.insert(DateModel(day: -1, date: Date()), at: 0)
        }
        
    return days
    }
    
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        // CustomDatePicker()
        ContentView()
    }
}

extension Date{
    func getAllDates() -> [Date]{
        let calendar = Calendar.current
        
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: self)!
        
        
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
