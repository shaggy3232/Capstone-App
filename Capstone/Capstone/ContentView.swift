//
//  ContentView.swift
//  Capstone
//
//  Created by Alan David Kumaran on 2020-10-09.
//  Copyright © 2020 Shaggy Bremnath. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    
    func getUser() {
        session.listen()
    }
    
    var body: some View {
        Group {
            if (session.session != nil) {
                Text("Welcome back")
            } else {
                Text("Show Auth Screen")
            }
        }.onAppear(perform: getUser)
        
        
            ZStack{
                VStack{
                    TabView{
                        
                        NutrientBreakdownView().tag(0)
                        
                        DailyLogView().tag(1)
                        
    
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
             
      }
    }
        
        
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
    }
}
