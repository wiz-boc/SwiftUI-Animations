//
//  RecordPlayerBox.swift
//  RecordPlayer
//
//  Created by wizz on 9/17/22.
//

import SwiftUI

struct RecordPlayerBox: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 345, height: 345, alignment: .center)
                .cornerRadius(10)
            Image("woodGrain")
                .resizable()
                .frame(width: 325, height: 325, alignment: .center)
                .shadow(color: .white, radius: 3, x: 0, y: 0)
        }
    }
}

struct RecordPlayerBox_Previews: PreviewProvider {
    static var previews: some View {
        RecordPlayerBox()
    }
}
