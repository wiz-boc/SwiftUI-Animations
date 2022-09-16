//
//  ContentView.swift
//  AnimatingCircle
//
//  Created by wizz on 9/16/22.
//

import SwiftUI

struct ContentView: View {
    @State private var scaleInOut = false
    @State private var rotateInOut = false
    @State private var moveInOut = false
    var body: some View {
        ZStack{
            Rectangle()
                .edgesIgnoringSafeArea(.all)
            ZStack{
                ZStack{
                    Circle().fill(LinearGradient(gradient: Gradient(colors: [.green,.white]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? -60 : 0)
                    
                    Circle().fill(LinearGradient(gradient: Gradient(colors: [.green,.white]), startPoint: .bottom, endPoint: .top))
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? 60 : 0)
                }
                .opacity(0.5)
                
                ZStack{
                    Circle().fill(LinearGradient(gradient: Gradient(colors: [.green,.white]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? -60 : 0)
                    
                    Circle().fill(LinearGradient(gradient: Gradient(colors: [.green,.white]), startPoint: .bottom, endPoint: .top))
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? 60 : 0)
                }
                .opacity(0.5)
                .rotationEffect(.degrees(60))
                
                
                ZStack{
                    Circle().fill(LinearGradient(gradient: Gradient(colors: [.green,.white]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? -60 : 0)
                    
                    Circle().fill(LinearGradient(gradient: Gradient(colors: [.green,.white]), startPoint: .bottom, endPoint: .top))
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? 60 : 0)
                }
                .opacity(0.5)
                .rotationEffect(.degrees(120))
                
            }
            .rotationEffect(.degrees(rotateInOut ? 90 : 0))
            .scaleEffect(scaleInOut ? 1 : 1/4)
            .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(1/8), value: rotateInOut)
            .onAppear{
                moveInOut.toggle()
                scaleInOut.toggle()
                rotateInOut.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
