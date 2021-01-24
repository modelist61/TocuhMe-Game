//
//  TimerTestScreen.swift
//  mEmoji
//
//  Created by Dmitry Tokarev on 14.01.2021.
//

import SwiftUI

struct TimerTestScreen: View {
    
    @ObservedObject var countdownTimer = CountdownTimer()


    
    var body: some View {
    
        
        VStack {
            Text(self.countdownTimer.showTimer)
            Button("Start", action: self.countdownTimer.start)
            Button("Pause", action: self.countdownTimer.pause)
            Button("Reset", action: self.countdownTimer.reset)


        }
    }
}

struct TimerTestScreen_Previews: PreviewProvider {
    static var previews: some View {
        TimerTestScreen()
    }
}
