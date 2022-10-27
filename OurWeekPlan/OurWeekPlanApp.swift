//
//  OurWeekPlanApp.swift
//  OurWeekPlan
//
//  Created by Dimitrije Pesic on 25/10/2022.
//

import SwiftUI

@main
struct OurWeekPlanApp: App {
    
    @StateObject var splashScreenManager = SplashScreenManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                ContentView()
                if splashScreenManager.state != .done {
                SplashScreen()
            }
            }
            .environmentObject(splashScreenManager)
            
        }
    }
}
