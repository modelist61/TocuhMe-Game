//
//  Background.swift
//  mEmoji
//
//  Created by Dmitry Tokarev on 19.01.2021.
//

import SwiftUI

struct Background: View {
    var body: some View {
        LinearGradient(gradient:
                        Gradient(colors:
                                    [Color.mainPink,
                                     Color.white]),
                       startPoint: .bottom,
                       endPoint: .topLeading)
            .ignoresSafeArea()
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        TestScreenBackground()
    }
}
