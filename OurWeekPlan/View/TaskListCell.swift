//
//  TaskListCell.swift
//  OurWeekPlan
//
//  Created by Dimitrije Pesic on 26/10/2022.
//

import Foundation
import SwiftUI

struct TaskListCell: View {
let task: HomeTask
@ObservedObject var doneTasks = DoneTasks()
    
    
    var body: some View {
HStack{
    Text(task.person + " -")
        .font(.system(size: 20)).bold()
    Text(task.task)
        .font(.system(size: 20))
    Spacer()
    Text(task.points + " Poeng")
        .font(.system(size: 15))
    if doneTasks.contains(task) {
    Image(systemName: "heart.fill")
            .foregroundColor(.red)
            .font(.system(size: 30))
        .onTapGesture {
            doneTasks.remove(task)
        }
    } else {
        Image(systemName: "heart")
            .foregroundColor(.gray)
            .font(.system(size: 30))
            .onTapGesture {
                doneTasks.add(task)
            }
    }
}
.foregroundColor(.black)
    }
}
