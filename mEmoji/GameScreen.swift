//
//  GameScreen.swift
//  mEmoji
//
//  Created by Dmitry Tokarev on 19.01.2021.
//

import SwiftUI
import AVFoundation

let defaultTimeRemain: CGFloat = 10

struct GameScreen: View {
    
    @Binding var hideOnMain: Bool
    @Binding var finishGame: Bool
    @Binding var goMain: Bool
    @Binding var selectLevel: Double
    @Binding var tapCount: Int
//    @Binding var oneSecond: Double
    
    @State private var offSet = (0, 0)

//    @State private var tapCount = 0
    @State private var isActiveObject = false
    
    @State private var isActiveTimer = false
    @State private var timeRemaining: CGFloat = defaultTimeRemain
    let mainTimer = Timer
        .publish(every: 0.01, on: .main, in: .common)
        .autoconnect()
    
    @State private var oneSecond = 0.0
    
    var body: some View {
        
        let oneSecondFilter = oneSecond.rounded()
        
        ZStack {
            VStack {
                ProgressView(value: abs(timeRemaining), total: defaultTimeRemain)
                    .progressViewStyle(TimeLineProgressViewStyle(timeRemaining: $timeRemaining))
                    
//                Text("\(tapCount)")
//                Text("\(oneSecond)")
//                Text("\(oneSecondFilter)")
//
//                Button("START") {
//                    changeOpacity()
//                }
                Spacer()
            }
            VStack {
                Spacer()
                ZStack {
                    CountdownCircle(countDownTimerActive: $finishGame,
                                    isActiveTimer: $isActiveTimer)
                        .offset(y: -44)
//                        .hidden()
                        
                    
                    Image("28-3")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.red)
                        .offset(x: CGFloat(offSet.0), y: CGFloat(offSet.1))
                        .shadow(radius: 10 )
                        .opacity(isActiveObject ? 1.0 : 0.0)
                        .onTapGesture {
                            tapCount += 1
                            isActiveObject = false
                            AudioServicesPlaySystemSound(1103) //Sound
                            AudioServicesPlaySystemSound(1351) //Vibe

                        }
                        .onChange(of: oneSecondFilter) { _ in
                            changeOpacity()
                        }
                }
                Spacer()
            }
            
            
        }
        .onReceive(mainTimer, perform: { _ in
            onReciveTimer()
        })
    }
    
    func changeOpacity() {
            if isActiveTimer  {
                isActiveObject.toggle()
                offSet = (Int.random(in: -150...150),
                          Int.random(in: -300...370))
                
            }
        }
    
    func onReciveTimer() {
        guard isActiveTimer else { return }
        if timeRemaining > 0.00 {
            timeRemaining -= 0.01
            oneSecond += selectLevel
        } else {
//            AudioServicesPlaySystemSound(1023)
            AudioServicesPlaySystemSound(1003)
            isActiveTimer = false
            timeRemaining = defaultTimeRemain
            hideOnMain = false
            goMain = true
            isActiveObject = false
            oneSecond = 0.0
        }
    }
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen(hideOnMain: .constant(true), finishGame: .constant(true), goMain: .constant(false), selectLevel: .constant(0.01), tapCount: .constant(0))
    }
}
