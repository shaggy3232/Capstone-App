//
//  Food.swift
//  Capstone
//
//  Created by Shaggy Bremnath on 2020-11-30.
//  Copyright © 2020 Shaggy Bremnath. All rights reserved.
//

import Foundation

struct Food : Decodable {
    let id: Int
    let original: String
    let originalName : String
    let amount: Float
    let nutrition: Nutrition
}

struct Nutrition :Decodable {
    let nutrients: [breakdown]
   
}

struct breakdown : Decodable {
    let title: String
    let amount: Float
    let unit: String
    let percentOfDailyNeeds: Float
}
