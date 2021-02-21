//
//  NutrientBreakdownView.swift
//  Capstone
//
//  Created by Shaggy Bremnath on 2020-10-09.
//  Copyright © 2020 Shaggy Bremnath. All rights reserved.
//

import SwiftUI

struct NutrientBreakdownView: View {
    @State var meals : [MealNutrientBreakdown]
    @State var totalCalories : Float
    @State var totalCarbs : Float
    @State var totalFats : Float
    @State var totalprotien : Float

    var columns = Array(repeating: GridItem(.flexible(),spacing: 20), count: 2)
    
    var body: some View {
        ZStack{
            VStack{
                Text("Nutrient breakdown")
                Text(String(format: "%.2f", self.totalCalories))
                Nutrient_tracker_View(nutrient: "Calories", amount: totalCalories)
                HStack{
                smallCircleTracker(nutrient: "Carbohydrates", amount: totalCarbs)
                smallCircleTracker(nutrient: "Protein", amount: totalprotien)
                smallCircleTracker(nutrient: "Fats", amount: totalFats)
                }
            }
        }
    }
}

//struct NutrientBreakdownView_Previews: PreviewProvider {
//    static var previews: some View {
//        NutrientBreakdownView()
//    }
//}
