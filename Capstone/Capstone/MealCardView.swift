//
//  MealCardView.swift
//  Capstone
//
//  Created by Shaggy Bremnath on 2020-10-09.
//  Copyright © 2020 Shaggy Bremnath. All rights reserved.
//

import SwiftUI

struct MealCardView: View {
    
    
    @Binding var mealName:String
    @Binding var totalCalories:String
    @Binding var mealTime:String
    @Binding var mealImage:String
    
    var body: some View {
        ZStack{
            HStack{
                VStack{
                    Text(mealName)
                        .bold()
                        .foregroundColor(.white)
                    Text("Calories:\(totalCalories)")
                        .foregroundColor(.white)
                }
            }
        }
        .padding(10)
        .background(Color.blue)
        .cornerRadius(20)
    }
}


struct MealCardView_Previews: PreviewProvider {
    static var previews: some View {
        MealCardView( mealName: Binding.constant("blac"), totalCalories: Binding.constant("adsf"), mealTime: Binding.constant("adad"), mealImage: Binding.constant("adfads"))
    }
}
