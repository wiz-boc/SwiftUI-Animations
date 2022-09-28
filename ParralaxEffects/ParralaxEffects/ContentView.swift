//
//  ContentView.swift
//  ParralaxEffects
//
//  Created by wizz on 9/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animate1 = false
    @State private var animate2 = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing
            )
            .colorInvert()
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Parallax Effect")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top,80)
                
                VStack{
                    Image("wolf")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .cornerRadius(25)
                        .shadow(color: .black, radius: 30, x: 5, y: 5)
                }.rotation3DEffect(.degrees(animate1 ? 13 : -13),axis: (x: animate1 ? 90 : 45, y: animate1 ? -45 : 90,z: 0.0))
                    .animation(Animation.easeInOut(duration: 3.5).repeatForever(autoreverses: true), value: animate1)
                    .onAppear{
                        animate1.toggle()
                    }
                    .padding(30)
                
                VStack{
                    Image("cube")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .cornerRadius(25)
                        .shadow(color: .black, radius: 30, x: 5, y: 5)
                }.rotation3DEffect(.degrees(animate2 ? 13 : -13),axis: (x: animate2 ? 90 : 45, y: animate1 ? -45 : 90,z: 0.0))
                    .animation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true), value: animate2)
                    .onAppear{
                        animate2.toggle()
                    }
                    .padding(30)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
