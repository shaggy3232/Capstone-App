//
//  NutrientAPIManager.swift
//  Capstone
//
//  Created by Shaggy Bremnath on 2020-11-28.
//  Copyright © 2020 Shaggy Bremnath. All rights reserved.
//

import Foundation


class NutrientAPIManager : ObservableObject{
    init(){
        
    }
    func getNutrientData(){
        
        let headers = [
            "x-rapidapi-key": "1fca44f33dmshb760d0a9640fafcp17169ejsne812fb570e6c",
            "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        ]
        
        let url = URL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/food/ingredients/9003/information?amount=120&unit=gram")!
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
                if let data = data{
                    let Mealdata = JSONDecoder()
                    do {
                        let decodedData = try Mealdata.decode(Food.self, from: data)
                        print(decodedData.nutrition)
                    } catch let error{
                        print(error)
                    }
                }
        }).resume()
        
    }
    
}
