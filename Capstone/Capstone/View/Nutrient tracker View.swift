//
//  Calorie tracker View.swift
//  Capstone
//
//  Created by Shaggy Bremnath on 2020-12-01.
//  Copyright © 2020 Shaggy Bremnath. All rights reserved.
//

import SwiftUI

struct Nutrient_tracker_View: View {
    @State var nutrient : String
    @State var amount : Float
    var colors : [Color] = [.green,.blue,.white,.green]
        
    var body: some View {
        Text(nutrient)
        ZStack{
            
            Circle()
                .fill(Color.white)
            .frame(width: 250, height: 250)
            .overlay(
                Circle()
                    .trim(from: 0, to: CGFloat(amount)/2000)
                    .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                    .fill(AngularGradient(gradient: .init(colors: colors), center: .center, startAngle: .zero,endAngle: .init(degrees: 360)))
            ).animation(.spring(response: 1.0, dampingFraction: 1.0, blendDuration: 1.0))
        }
    }
}

//struct Calorie_tracker_View_Previews: PreviewProvider {
//    static var previews: some View {
//        Calorie_tracker_View()
//    }
//}
