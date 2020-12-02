//
//  smallCircleTracker.swift
//  Capstone
//
//  Created by Shaggy Bremnath on 2020-12-01.
//  Copyright © 2020 Shaggy Bremnath. All rights reserved.
//

import SwiftUI

struct smallCircleTracker: View {
        @State var nutrient : String
        @State var amount : Float
        var colors : [Color] = [.green,.blue,.white,.green]
            
        var body: some View {
            VStack{
                Text(nutrient)
                ZStack{
                    
                    Circle()
                        .fill(Color.white)
                    .frame(width: 100, height: 100)
                    .overlay(
                        Circle()
                            .trim(from: 0, to: CGFloat(amount)/100)
                            .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                            .fill(AngularGradient(gradient: .init(colors: colors), center: .center, startAngle: .zero,endAngle: .init(degrees: 360)))
                    ).animation(.spring(response: 1.0, dampingFraction: 1.0, blendDuration: 1.0))
                }
        }
    }
    
}

//struct smallCircleTracker_Previews: PreviewProvider {
//    static var previews: some View {
//        smallCircleTracker()
//    }
//}
