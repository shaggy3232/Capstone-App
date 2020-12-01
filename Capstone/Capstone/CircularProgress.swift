//
//  CircularProgress.swift
//  Capstone
//
//  Created by Shehryar Malik on 2020-12-01.
//  Copyright © 2020 Shaggy Bremnath. All rights reserved.
//

import SwiftUI

struct CircularProgress: View {
    @State var percentage: CGFloat = 0
    var body: some View {
        ZStack{
            Color.backgroundColor
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                ZStack{
                    Pulsation()
                    Track()
                    Label(percentage: percentage)
                    Outline(percentage: percentage)
                }
                Spacer()
                HStack{
                    Button(action: {
                        self.percentage = CGFloat(20)
                    }){
                        Image(systemName: "play.circle.fill")
                            .frame(width: 65, height: 65)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct Label: View{
    var percentage: CGFloat = 0
    var body: some View{
        ZStack{
            Text(String(format: "%.0f", percentage)).font(.system(size:65)).fontWeight(.heavy).colorInvert()
        }
    }
}

struct Outline: View{
    var percentage: CGFloat = 0
    var colors: [Color] = [Color.outlineColor]
    var body: some View{
        ZStack{
            Circle()
                .fill(Color.clear)
                .frame(width: 250, height: 250).overlay(Circle().trim(from: 0,
                                                                      to: percentage * 0.01).stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round)).fill(AngularGradient(gradient: .init(colors: colors), center: .center, startAngle: .zero, endAngle: .init(degrees: 360)))
                ).animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
        }
    }
}

struct Track: View{
    var colors: [Color] = [Color.trackColor]
    var body: some View{
        ZStack{
            Circle().fill(Color.backgroundColor)
                .frame(width: 250, height: 250)
                .overlay(
                    Circle().stroke(style: StrokeStyle(lineWidth: 20))
                        .fill(AngularGradient(gradient: .init(colors: colors), center: .center))
                )
        }
    }
}

struct Pulsation: View{
    @State private var pulsate = false
    var colors: [Color] = [Color.pulsatingColor]
    var body: some View{
        ZStack{
            Circle()
                .fill(Color.pulsatingColor)
                .frame(width:245, height:245)
                .scaleEffect(pulsate ? 1.3 : 1.1)
                .animation(Animation.easeInOut(duration: 1.1).repeatForever(autoreverses: true)).onAppear{
                    self.pulsate.toggle()
                }
        }
    }

}
struct CircularProgress_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgress()
    }
}
