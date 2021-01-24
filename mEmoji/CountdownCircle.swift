//
//  CountdownCircle.swift
//  mEmoji
//
//  Created by Dmitry Tokarev on 21.01.2021.
//

import SwiftUI
import AVFoundation

struct CountdownCircle: View {
        
    @State private var countDownTimerRemaining: CGFloat = 3.0
    let countDownTimer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    @Binding var countDownTimerActive: Bool
    @Binding var isActiveTimer: Bool
    
    var body: some View {
        ZStack {
            
            Circle()
                .stroke(Color.gray.opacity(0.5), style: StrokeStyle(lineWidth: 30, lineCap: .round))
            Circle()
                .trim(from: 0.0,
                      to: countDownTimerRemaining * 0.33 )
                .stroke(Color.mainPink,
                        style: StrokeStyle(lineWidth: 30, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .shadow(color: .black, radius: 4, x: 2, y: 2)
                .animation(.easeInOut)
            
            Text("\(Int(countDownTimerRemaining))")
                .font(.system(size: 130))
                .foregroundColor(Color.mainPink)
                .fontWeight(.heavy)
                .shadow(color: .black, radius: 4, x: 2, y: 2)

                
        }.frame(width: 210, height: 210)
        .opacity( countDownTimerActive ? 1.0 : 0.0 )
        .onReceive(countDownTimer, perform: { _ in
            guard countDownTimerActive else { return }
            if countDownTimerRemaining > 0 {
                countDownTimerRemaining -= 1
                AudioServicesPlaySystemSound(1052)
//                circleAnimation.toggle()

            } else {
                countDownTimerActive = false
                isActiveTimer = true
                AudioServicesPlaySystemSound(1001)
                countDownTimerRemaining = 3
            }
        })
    }
}

struct CountdownCircle_Previews: PreviewProvider {
    static var previews: some View {
        CountdownCircle(countDownTimerActive: .constant(true), isActiveTimer: .constant(false))
    }
}
