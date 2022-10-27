//
//  ContentView.swift
//  OurWeekPlan
//
//  Created by Dimitrije Pesic on 25/10/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var title: String = "Dagens oppgaver:"
    @EnvironmentObject var splashScreenManager: SplashScreenManager
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
        
                    Text(viewModel.returnDay())
                        .font(.system(size: 64.0, weight: .heavy, design: .rounded))
                        
                
                Text(title)
                    .font(.system(size:20.0, weight: .heavy, design:.rounded))
                if let tasks = viewModel.tasks {
                    List(tasks) { task in
                        TaskListCell(task: task)
                    }
                    .listStyle(.inset)
                }
                HStack{
                Text("Dimi")
                        .onTapGesture{
                            viewModel.fetchTasks(person: "Dimi")
                            title = "Alle Dimi sine ukeoppgaver:"
                        }
                Text("| Alle oppgaver |")
                        .onTapGesture{
                            viewModel.fetchTasks(person: "any")
                            title = "Dagens oppgaver:"
                        }
                Text("Olga")
                        .onTapGesture{
                            viewModel.fetchTasks(person: "Olga")
                            title = "Alle Olga sine ukeoppgaver:"
                        }
            }
                .font(.system(size: 28.0, weight: .heavy, design: .rounded))
            }
            .foregroundColor(.white)
            
                }
            
    
        .background(Color.cyan)
        .onAppear{
            
            DispatchQueue
                .main
                .asyncAfter(deadline: .now() + 2) {
                    splashScreenManager.dismiss()
                }
        }
}
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SplashScreenManager())
    }
}
