//
//  SimpleTimer.swift
//  mEmoji
//
//  Created by Dmitry Tokarev on 19.01.2021.
//

import SwiftUI

let mainTimerRemaining: CGFloat = 10
let lineWidth: CGFloat = 30
let radius: CGFloat = 70

struct SimpleTimer: View {
    
    @State private var isActiveTimer = false
    @State private var timeRmaining2: CGFloat = mainTimerRemaining
    let mainTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var radiusRamin: CGFloat { timeRmaining2 / mainTimerRemaining }
    var raiusColor: Color { timeRmaining2 > 6 ?
        Color.green : timeRmaining2 > 3 ? Color.yellow : Color.red }
    
    var body: some View {
        
        VStack(spacing: 25) {
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.3), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                Circle()
                    .trim(from: 0.0, to: radiusRamin)
                    .stroke(raiusColor, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut)
                Text("\(Int(timeRmaining2))")
                    .font(.largeTitle )
            }.frame(width: radius * 3, height: radius * 3)
            
            HStack(spacing: 25) {
                Label("\( isActiveTimer ? "Pause" : "Play" )",
                      systemImage: isActiveTimer ? "pause.fill" : "play.fill")
                    .foregroundColor( isActiveTimer ? .red : .green)
                    .font(.title)
                    .onTapGesture(perform: {
                        isActiveTimer.toggle()
                    })
                Label("Resume", systemImage: "backward.fill")
                    .foregroundColor(.black)
                    .font(.title)
                    .onTapGesture(perform: {
                        isActiveTimer = false
                        timeRmaining2 = mainTimerRemaining
                    })
            }
        }.onReceive(mainTimer, perform: { _ in
            guard isActiveTimer else { return }
            if timeRmaining2 > 0 {
                timeRmaining2 -= 1
            } else {
                isActiveTimer = false
                timeRmaining2 = mainTimerRemaining
            }
        })
    }
}

struct SimpleTimer_Previews: PreviewProvider {
    static var previews: some View {
        SimpleTimer()
    }
}

