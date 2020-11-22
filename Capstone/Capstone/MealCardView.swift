//
//  MealCardView.swift
//  Capstone
//
//  Created by Shaggy Bremnath on 2020-10-09.
//  Copyright © 2020 Shaggy Bremnath. All rights reserved.
//

import SwiftUI

struct MealCardView: View {
    
    
    @Binding var meal: Meal
   
    
    var body: some View {
        ZStack{
            HStack{
                VStack{
                    Text(meal.Name)
                        .font(.title)
                        .foregroundColor(.white)
                    Spacer()
                    HStack{
                        VStack{
                        Spacer(minLength: 0)
                        Text("Calories:\(meal.Weight)")
                            .foregroundColor(.white)
                            
                        }
                    }
                }
            }
        }
        .padding(10)
        .background(Color( red: 45/100, green: 80/100, blue: 55/100))
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}


//struct MealCardView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        MealCardView( meal:)
//    }
//}
