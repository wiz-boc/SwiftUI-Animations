//
//  ContentView.swift
//  BreathingFlower
//
//  Created by wizz on 9/19/22.
//

import SwiftUI

struct ContentView: View {
    @State private var petal = false
    @State private var showShadow = false
    @State private var breathInLabel = true
    @State private var breathOutLabel = false
    @State private var breath = false
    @State private var diffuseOnExhale = false
    let backgroundColor = Color(UIColor.black)
    var body: some View {
        ZStack{
            backgroundColor.edgesIgnoringSafeArea(.all)
            ZStack{
                Text("Breath In")
                    .font(Font.custom("paprus", size: 35))
                    .foregroundColor(Color(UIColor.green))
                    .opacity(breathInLabel ? 0:1)
                    .scaleEffect(breathInLabel ? 0 : 1)
                    .offset(y: -160)
                    .animation(.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathInLabel)
                
                Text("Breath Out")
                    .font(Font.custom("paprus", size: 35))
                    .foregroundColor(Color(UIColor.orange))
                    .opacity(breathOutLabel ? 0:1)
                    .scaleEffect(breathOutLabel ? 0 : 1)
                    .offset(y: -160)
                    .animation(.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathOutLabel)
                
                VStack{
                    ZStack{
                        VStack{
                            //MARK: - BREATH
                            Image("breath").resizable().frame(width: 35, height: 125, alignment: .center)
                                .offset(y: breath ? 90 : 0)
                                .animation(Animation.timingCurve(0.65, -2.6, 0.32, 0.4).delay(0.05).speed(0.1).repeatForever(autoreverses: true), value: true)
                        }
                        .blur(radius: diffuseOnExhale ? 1 : 60)
                        .offset(x: 0, y: diffuseOnExhale ? -50 : -100)
                        
                        Petal(petal: $petal, degress: petal ? -25 : -5)
                        Image("flower").resizable().frame(width: 75, height: 125, alignment: .center)
                        Petal(petal: $petal, degress: petal ? 25 : 5)
                        Petal(petal: $petal, degress: petal ? -50 : -10)
                        Petal(petal: $petal, degress: petal ? 50 : 10)
                        
                        Image("bottomFlowers").resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 4000, alignment: .center)
                            .rotationEffect(.degrees(32))
                            .offset(x: -25, y: 90)
                        
                        Image("bottomFlowers").resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 4000, alignment: .center)
                            .rotationEffect(.degrees(32))
                            .offset(x: -20, y: 190)
                    }
                    .shadow(radius: showShadow ? 20 : 0)
                    .hueRotation(Angle(degrees: showShadow ? 0 : 180))
                    .animation(.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: showShadow)
                    
                }
            }.offset(y: -100)
        }
        .onAppear {
            breathInLabel.toggle()
            breathOutLabel.toggle()
            breath.toggle()
            diffuseOnExhale.toggle()
        }
    }
}

struct Petal: View {
    @Binding var petal: Bool
    var degress: Double = 0.0
    var body: some View {
        Image("flower").resizable().frame(width: 75, height: 125, alignment: .center)
            .rotationEffect(.degrees(petal ? degress : degress), anchor: .bottom)
            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: petal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
