//
//  TimeLineProgressViewStyle.swift
//  mEmoji
//
//  Created by Dmitry Tokarev on 19.01.2021.
//

import SwiftUI

struct TimeLineProgressViewStyle: ProgressViewStyle {
    
    @Binding var timeRemaining: CGFloat
    
    let greenTimeLine = defaultTimeRemain / 3
    let yellowTimeLine = defaultTimeRemain / 6
    
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .scaleEffect(y: 6)
            .frame(height: 25)
            .accentColor( timeRemaining > greenTimeLine ?
                            Color.mainPink :
                            timeRemaining > yellowTimeLine ?
                            .yellow :
                            .red)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .padding(.horizontal)
            .shadow(color: .black, radius: 4, x: 2, y: 2)
            .animation(.easeIn)
    }
}

