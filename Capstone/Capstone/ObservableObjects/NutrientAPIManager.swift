//
//  NutrientAPIManager.swift
//  Capstone
//
//  Created by Shaggy Bremnath on 2020-11-28.
//  Copyright © 2020 Shaggy Bremnath. All rights reserved.
//

import Foundation


class NutrientAPIManager : ObservableObject{
    @Published var MealNutrientList = [MealNutrientBreakdown]()
    @Published var TotalCalories = Float()
   
    init(){
        
    }
    func getTotalCalories(){
        for object in self.MealNutrientList{
            self.TotalCalories += object.Calories
        }
        print(self.TotalCalories)
    }

    func getNutrientData(meal : Meal){
        let foodid = meal.Food_id
        let weight = meal.Weight
        
        let headers = [
            "x-rapidapi-key": "1fca44f33dmshb760d0a9640fafcp17169ejsne812fb570e6c",
            "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        ]
        
        let url = URL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/food/ingredients/\(foodid)/information?amount=\(weight)&unit=gram")!
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let _: Void = session.dataTask(with: request, completionHandler: { data, response, error in
                if let data = data{
                    let Mealdata = JSONDecoder()
                    do {
                        let decodedData = try Mealdata.decode(Food.self, from: data)
                        DispatchQueue.main.async {
                            self.MealNutrientList.append(MealNutrientBreakdown(Name: decodedData.originalName, Calories: decodedData.nutrition.nutrients[0].amount))
                        }
                        
                        
                        
                    } catch let error{
                        print(error)
                    }
                }
        }).resume()
        
    }
    
}
