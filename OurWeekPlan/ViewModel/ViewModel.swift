//
//  ViewModel.swift
//  OurWeekPlan
//
//  Created by Dimitrije Pesic on 25/10/2022.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    private let dataService = DataService()
    var dateToday: Date = Date.now
    @Published var tasks: [HomeTask]? = nil
    
    init () {
        
        Task {
            do{
                fetchTasks(person: "any")
            }
        }
        
    }
    
    
    func fetchTasks(person: String) {
        Task{
            do {
                tasks = try await dataService.fetchTasks(person: person, day: returnDay())
            } catch {
                print(error)
            }
        }
    }
    func returnDay() -> String {
        let df = Date()
        return df.formatted(.dateTime.weekday(.wide).locale(Locale(identifier: "nb_NO")))
    }
    
}
