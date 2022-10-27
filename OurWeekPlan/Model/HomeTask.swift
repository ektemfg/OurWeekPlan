//
//  HomeTask.swift
//  OurWeekPlan
//
//  Created by Dimitrije Pesic on 26/10/2022.
//

import Foundation

struct Result: Codable {
    let result: [HomeTask]
}

struct HomeTask: Codable, Identifiable, Hashable {
    let id, type: String
    let day: String
    let isDone: Bool
    let person, points, task: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case type = "_type"
        case day, isDone, person, points, task
    }
}
