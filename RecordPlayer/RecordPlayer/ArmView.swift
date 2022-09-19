//
//  ArmView.swift
//  RecordPlayer
//
//  Created by wizz on 9/17/22.
//

import SwiftUI

struct ArmView: View {
    @Binding var rotateArm: Bool
    var body: some View {
        Image("playerArm")
            .resizable()
            .frame(width: 150, height: 150, alignment: .center)
            .shadow(color: .gray, radius: 2, x: 0, y: 0)
            .rotationEffect(Angle.degrees(-35), anchor: .topTrailing)
            .rotationEffect(Angle.degrees(rotateArm ? 8 : 0), anchor:  .topTrailing)
            .animation(Animation.linear(duration: 2), value: rotateArm)
            .offset(x: 70, y: -250)
    }
}

struct ArmView_Previews: PreviewProvider {
    static var previews: some View {
        ArmView(rotateArm: .constant(true))
    }
}
