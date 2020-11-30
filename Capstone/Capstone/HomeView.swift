//
//  HomeView.swift
//  Capstone
//
//  Created by Shaggy Bremnath on 2020-10-12.
//  Copyright © 2020 Shaggy Bremnath. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = MealViewModel()
    var body: some View {
        
        ZStack{
            VStack{
                TabView{
                    NutrientBreakdownView().tag(0)
                    DailyLogView(meals: viewModel.Meal_data).tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
         
  }
}
}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
