//
//  DataService.swift
//  OurWeekPlan
//
//  Created by Dimitrije Pesic on 26/10/2022.
//

import Foundation

struct DataService {
    
    private static let sanityProjectId = "pjv57mjg"
    private static let dataset = "production"
    private static let sanityQueryBaseUrl = ".api.sanity.io/v1/data/query/production?query="
     static let sanityMutateBaseUrl = ".api.sanity.io/v2021-06-07/data/mutate/production"
    let finalURL: String = "https://" + sanityProjectId + sanityQueryBaseUrl
    
    private func performRequest(_ url:String) async throws -> [HomeTask] {
        let url = URL(string: url)
        let request = URLRequest(url: url!)
        let (data, _) = try await URLSession.shared.data(for: request)
        print(data)
        let taskData = try JSONDecoder().decode(Result.self, from: data)
        return taskData.result
    }
    
    func fetchTasks(person:String, day: String) async throws -> [HomeTask]  {
        var taskQuery = ""
        if (person.lowercased() == "any") {
            taskQuery = "*[day%20==%20%27" + day + "%27]"
        } else {
            taskQuery = "*[person%20==%20%27" + person + "%27]"
        }
        let urlString = finalURL + taskQuery
        print(urlString)
        return try await performRequest(urlString)
    }

}
