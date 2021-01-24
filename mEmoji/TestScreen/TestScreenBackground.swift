//
//  TestScreenBackground.swift
//  mEmoji
//
//  Created by Dmitry Tokarev on 14.01.2021.
//

import SwiftUI

struct TestScreenBackground: View {
    var body: some View {
        LinearGradient(gradient:
                        Gradient(colors:
                                    [Color(UIColor(red: 244.0/255.0,
                                                   green: 174.0/255.0,
                                                   blue: 211.0/255.0,
                                                   alpha: 1.0)),
                                          Color.white]),
                       startPoint: .bottom,
                       endPoint: .topLeading)
            .ignoresSafeArea()
    }
}

struct TestScreenBackground_Previews: PreviewProvider {
    static var previews: some View {
        TestScreenBackground()
    }
}
