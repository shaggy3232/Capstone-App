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
    
    func getNutrientMealData(){
        let mealList = self.viewmodel.Meal_data
        for object in mealList{
            self.nutrientAPI.getNutrientData(meal: object)
        }
    }
    
    var body: some View {
        Group {
            if (session.session != nil) {
                ZStack{
                    VStack{
                        TabView{
                            Welcome().tag(2)
                            NutrientBreakdownView(meals: self.nutrientAPI.MealNutrientList, totalCalories: self.nutrientAPI.TotalCalories).tag(1)
                            DailyLogView(meals: viewmodel.Meal_data).tag(0)
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        Button("Get nutrients"){
                            self.getNutrientMealData()
                        }
                        Button("Get total Calories"){
                            self.nutrientAPI.getTotalCalories()
                        }
                 
          }
        }.onAppear(){
            viewmodel.getMeals()

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
