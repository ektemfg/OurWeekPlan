//
//  DoneTasks.swift
//  OurWeekPlan
//
//  Created by Dimitrije Pesic on 26/10/2022.
//

import Foundation

class DoneTasks: ObservableObject {
    private var tasks: Set<HomeTask>
    private let saveKey = "DoneTasks"
    let defaults = UserDefaults.standard
    
    init() {
        tasks = []
    }
    
    func contains(_ task: HomeTask) -> Bool {
        tasks.contains(task)
    }
    
    func add(_ task: HomeTask) {
        objectWillChange.send()
        tasks.insert(task)
        save()
    }
    
    func remove(_ task: HomeTask) {
        objectWillChange.send()
        tasks.remove(task)
        save()
    }
    
    func save() {
        // fix saving to defaults
        let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(tasks) {
                    defaults.set(encoded, forKey: "DoneTasks")
                }
    }
    
}
