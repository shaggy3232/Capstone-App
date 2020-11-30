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
    @ObservedObject var viewmodel = MealViewModel()
    @ObservedObject var nutrientAPI = NutrientAPIManager()
    
    func getUser() {
        session.listen()
    }
    
    var body: some View {
        Group {
            if (session.session != nil) {
                ZStack{
                    VStack{
                        TabView{
                            NutrientBreakdownView().tag(0)
                            DailyLogView(meals: viewmodel.Meal_data).tag(1)
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                 
          }
        }.onAppear(){
            viewmodel.getMeals()
            self.nutrientAPI.getNutrientData()
        }
                Button(action: session.signOut) {
                    Text ("Sign Out")
                }
            } else {
                AuthView()
            }
        }.onAppear(perform: getUser)
           
        
        
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
    }
}
