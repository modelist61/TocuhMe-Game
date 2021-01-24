//
//  TestScreen.swift
//  mEmoji
//
//  Created by Dmitry Tokarev on 08.01.2021.
//

import SwiftUI
import AVFoundation



struct TestScreen: View {

    
    @State private var startGame = false
    
    @State private var showHide = false
    @State private var opacityCircle = 1.0
    
    @State private var offSet = (0, 0)
    
    @State private var speed = 0.4
    @State private var tapCount = 0
    @State private var progress = 1.0
    @State private var timeRemain = 0
    
    @State private var rotationLogo = false
        
    var body: some View {
        
        let timer = Timer.publish(every: speed, on: .main, in: .common).autoconnect()
        
        VStack {
            ZStack {
                TestScreenBackground()
                VStack {
                    TestScreenHeaderLogo()
                    ZStack {
                        Image("28-3")
                            .resizable()
                            .frame(width: 250, height: 250)
                            .opacity( tapCount > 0 ? 0.0 : 1.0)
                            .onAppear(perform: {
                                rotationLogo = true
                            })
                            .rotationEffect(.degrees(rotationLogo ? 360 : 0))
                            .animation(.easeIn(duration: 1))
                        
                        TestScreenTapCount(tapCount: tapCount)
                        
                            .padding()
                        
                    }
                    Spacer()
                    
                    VStack(spacing: 15) {
                        TestScreenButton(buttonAction: {
                            speed = 0.5
                            timeRemain = 40
                            progress = 1.0
                            tapCount = 0
                        }, text: "EASY")
                        TestScreenButton(buttonAction: {
                            speed = 0.4
                            timeRemain = 40
                            progress = 1.0
                            tapCount = 0
                        }, text: "MEDIUM")
                        TestScreenButton(buttonAction: {
                            speed = 0.3
                            timeRemain = 40
                            progress = 1.0
                            tapCount = 0
                        }, text: "HARD")
                    }
                }.opacity( timeRemain == 0 ? 1.0 : 0.0)
            
                
                
//GAME STACK
                VStack {
                    ProgressView(value: abs(progress))
                    Text("-= \(tapCount) =-")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    ZStack {
                        TestScreenCircle(offSet: (offSet.0, offSet.1),
                                         opacityCircle: opacityCircle,
                                         onTap: onTap)

                            .onReceive(timer) { _ in
                                if timeRemain > 0 {
                                    timeRemain -= 1
                                    progress -= 0.025
                                    showHide.toggle()
                                    changeOpacity()
                                }
                                
                            }.padding()
                    }
                    Spacer()
                }.opacity( timeRemain == 0 ? 0.0 : 1.0)
                
            }
        }
    }
    
    func onTap() {
        if timeRemain > 0 {
            tapCount += 1
        }
        opacityCircle = 0
        changeOpacity()
        AudioServicesPlaySystemSound(1057)
    }
    
    func changeOpacity() {
        if showHide {
            opacityCircle = 0.0
        } else {
            offSet = (Int.random(in: -150...150), Int.random(in: 0...600))
            opacityCircle = 1.0
        }
    }
}

struct TestScreen_Previews: PreviewProvider {
    static var previews: some View {
        TestScreen()
    }
}
