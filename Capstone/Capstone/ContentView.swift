//
//  ContentView.swift
//  Capstone
//
//  Created by Shaggy Bremnath on 2020-09-23.
//  Copyright © 2020 Shaggy Bremnath. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewmodel = MealViewModel()
    var body: some View {
        
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
            }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
