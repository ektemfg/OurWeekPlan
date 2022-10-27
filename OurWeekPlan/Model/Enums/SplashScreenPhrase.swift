//
//  SplashScreenPhrase.swift
//  OurWeekPlan
//
//  Created by Dimitrije Pesic on 26/10/2022.
//

import Foundation

enum SplashScreenPhrase {
    case first
    case second
    case done
}

final class SplashScreenManager: ObservableObject {
    @Published private(set) var state: SplashScreenPhrase = .first
    
    func dismiss() {
        self.state = .second
        
        DispatchQueue
            .main
            .asyncAfter(deadline: .now()+1) {
                self.state = .done
            }
    }
}
