//
//  TestScreenCircle.swift
//  mEmoji
//
//  Created by Dmitry Tokarev on 11.01.2021.
//

import SwiftUI

struct TestScreenCircle: View {
    
    let offSet: (Int, Int)
    let opacityCircle: Double
    let onTap: () -> Void
    
    var body: some View {
        Image("28-3")
            .resizable()
            .frame(width: 100, height: 100)
            .foregroundColor(.red)
            .offset(x: CGFloat(offSet.0), y: CGFloat(offSet.1))
            .opacity(opacityCircle)
            .shadow(radius: 10 )
            .onTapGesture(count: 1) {
                onTap()
            }
    }
}

struct TestScreenCircle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TestScreenCircle(offSet: (0, 700), opacityCircle: 1.0, onTap: {})
            Spacer()
        }
       
    }
}
