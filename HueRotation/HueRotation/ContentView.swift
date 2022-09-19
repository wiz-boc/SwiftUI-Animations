//
//  ContentView.swift
//  HueRotation
//
//  Created by wizz on 9/17/22.
//

import SwiftUI

struct ContentView: View {
    @State private var shiftColors = false
    @State private var image = "dog"
    let backgroundColor = Color(.black)
    var body: some View {
        VStack{
            ZStack{
                backgroundColor
                    .edgesIgnoringSafeArea(.all)
                Image(image)
                    .resizable()
                    .padding(20)
                    .frame(width: 350, height: 350, alignment: .center)
                    .hueRotation(.degrees(shiftColors ? 360 * 2 : 0))
                    .animation(Animation.easeInOut(duration: 2).delay(0.4).repeatForever(autoreverses: true), value: shiftColors)
                    .onAppear{
                        shiftColors.toggle()
                    }
            }
            ImagePicker(selectedImage: $image)
                .frame(width: 350, height: 200, alignment: .center)
                .background(Color.black)
                .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct ImagePicker: View {
    @Binding var selectedImage: String
    let images: [String] = ["ornament","landscape","dog","dice","cat"]
    var body: some View {
        Picker("", selection: $selectedImage) {
            ForEach(images, id: \.self){ image in
                Text(image)
                    .foregroundColor(.white)
            }
        }.pickerStyle(WheelPickerStyle())
            .frame(width: 300, height: 150, alignment: .center)
            .background(Color.red.colorMultiply(.blue))
            .cornerRadius(20)
            .shadow(color: .white, radius: 5, x: 0, y: 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
