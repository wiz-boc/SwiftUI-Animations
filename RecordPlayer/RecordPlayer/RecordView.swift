//
//  RecordView.swift
//  RecordPlayer
//
//  Created by wizz on 9/17/22.
//

import SwiftUI

struct RecordView: View {
    
    @Binding var degress: Double
    @Binding var shouldAnimate: Bool
    
    var body: some View {
        Image("record")
            .resizable()
            .frame(width: 275, height: 275, alignment: .center)
            .shadow(color: .gray, radius: 1, x: 0, y: 0)
            .rotationEffect(Angle.degrees(degress))
            .animation(Animation.linear(duration: shouldAnimate ? 60 : 0).delay(1.5), value: shouldAnimate)
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView(degress: .constant(2.0), shouldAnimate: .constant(true))
    }
}
