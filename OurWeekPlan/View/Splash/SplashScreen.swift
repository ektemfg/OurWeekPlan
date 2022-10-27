//
//  SplashScreen.swift
//  OurWeekPlan
//
//  Created by Dimitrije Pesic on 26/10/2022.
//

import Foundation
import SwiftUI

struct SplashScreen: View {
    @EnvironmentObject var splashScreenManager: SplashScreenManager
    @State private var firstPhrase: Bool = false
    @State private var secondPhrase: Bool = false
    
    private let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            background
            logo
        }
        .onReceive(timer) { input in
                switch splashScreenManager.state {
                case .first:
                    withAnimation(.spring()) {
                        firstPhrase.toggle()
                }
                case .second:
                    withAnimation(.easeOut) {
                        secondPhrase.toggle()
                    }
                default: break
                }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

private extension SplashScreen {
    var background: some View {
        Color("splashbg")
            .edgesIgnoringSafeArea(.all)
    }
    
    var logo: some View {
        VStack{
        Image("heart")
            Text("Our Week Plan")
                .font(.system(size:20,weight: .bold, design: .rounded))
                .foregroundColor(.white)
    }
        .scaleEffect(firstPhrase ? 0.5 : 2)
    }
}
