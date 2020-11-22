//
//  DummyMealData.swift
//  Capstone
//
//  Created by Shaggy Bremnath on 2020-10-10.
//  Copyright © 2020 Shaggy Bremnath. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class MealViewModel: ObservableObject{

    @Published var Meal_data = [Meal]()

    func getMeals(){

        Firestore.firestore().collection("Meals")
            .addSnapshotListener{querySnapshot, error in
                guard let documents = querySnapshot?.documents else{
                    print ("Error Fetching Documents: \(error!)")
                    return
                }
               
                self.Meal_data = documents.map{queryDocumentSnapshot -> Meal in
                    let data = queryDocumentSnapshot.data()
                    let name = data["name"] as? String ?? "No Name Found"
                    let time = data["time"] as? String ?? "No Time Found"
                    let weight = data["weight"] as? String ?? "No Weight Found"
                    
                    return Meal(Name: name, Time: time, Weight: weight)
                }
        }
    }
}
