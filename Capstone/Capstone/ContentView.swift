//
//  ContentView.swift
//  Capstone
//
//  Created by Shaggy Bremnath on 2020-09-23.
//  Copyright © 2020 Shaggy Bremnath. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
            ZStack{
                VStack{
                    TabView{
                        
                        NutrientBreakdownView().tag(0)
                        
                        DailyLogView(meals: Meal_data).tag(1)
                        
    
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
             
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
