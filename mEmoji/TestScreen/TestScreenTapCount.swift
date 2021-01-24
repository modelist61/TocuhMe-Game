//
//  TestScreenTapCount.swift
//  mEmoji
//
//  Created by Dmitry Tokarev on 14.01.2021.
//

import SwiftUI



struct TestScreenTapCount: View {
    
    let tapCount: Int
    
    var body: some View {
        Text("\(tapCount)")
            .font(.system(size: 130))
            .foregroundColor(.init(UIColor(red: 253.0/255.0, green: 109.0/255.0, blue: 170.0/255.0, alpha: 1.0)))
            .fontWeight(.heavy)
            .shadow(color: .black, radius: 7, x: 5, y: 5)
            .opacity( tapCount > 0 ? 1.0 : 0.0)
    }
}

struct TestScreenTapCount_Previews: PreviewProvider {
    static var previews: some View {
        TestScreenTapCount(tapCount: 2)
    }
}
