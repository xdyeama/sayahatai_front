//
//  TaskModel.swift
//  SayahatAI
//
//  Created by Beket Barlykov  on 10.06.2023.
//

import SwiftUI

struct Task: Identifiable{
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

struct TaskMetaData: Identifiable{
    var id = UUID().uuidString
    var tasks: [Task]
    var taskDate: Date
}

func getSampleDate(offset: Int) -> Date{
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date()
}

var tasks: [TaskMetaData] = [
    TaskMetaData(
        tasks: [
            Task(title: "Go to the cinema"),
            Task(title: "Implement Calendar functionality"),
            Task(title: "Workout")
        ],
        taskDate: getSampleDate(offset: 1)
    ),
    TaskMetaData(
        tasks: [
            Task(title: "Swiftui challing session"),
        ],
        taskDate: getSampleDate(offset: -1)
    ),
    TaskMetaData(
        tasks: [
            Task(title: "Meeting with Tim Cock"),
        ],
        taskDate: getSampleDate(offset: -3)
    ),
    TaskMetaData(
        tasks: [
            Task(title: "Meeting with Tim Cock"),
        ],
        taskDate: getSampleDate(offset: -10)
    ),
    TaskMetaData(
        tasks: [
            Task(title: "Meeting with Tim Cock"),
        ],
        taskDate: getSampleDate(offset: 5)
    ),
]
