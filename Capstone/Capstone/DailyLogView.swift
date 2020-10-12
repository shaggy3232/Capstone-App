//
//  DailyLogView.swift
//  Capstone
//
//  Created by Shaggy Bremnath on 2020-10-09.
//  Copyright © 2020 Shaggy Bremnath. All rights reserved.
//

import SwiftUI

struct DailyLogView: View {
  
    
    @State var meals : [Meal]
    var columns = Array(repeating: GridItem(.flexible(),spacing: 20), count: 2)
    
    var body: some  View {
    
    ZStack{
        VStack{
            
            Text("Daily Log")
                .padding(20)
                .font(.largeTitle)
            
            
            LazyVGrid(columns: columns, spacing: 30){
          
                ForEach (meals.indices, id: \.self ){ index in
               
                    VStack(alignment: .leading, spacing: 15){
                    
                    
                        MealCardView(meal: self.$meals[index])
                    
                        }
                    }
                }
            
            Spacer()
            
            }
        }
    }
}

struct DailyLogView_Previews: PreviewProvider {
    static var previews: some View {
        DailyLogView( meals: Meal_data)
    }
}



