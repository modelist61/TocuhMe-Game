//
//  GameScreen.swift
//  mEmoji
//
//  Created by Dmitry Tokarev on 19.01.2021.
//

import SwiftUI
import AVFoundation

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

struct GameScreen: View {
    
    @Binding var hideOnMain: Bool
    @Binding var finishGame: Bool
    @Binding var goMain: Bool
    @Binding var selectLevel: Double
    @Binding var tapCount: Int
    //    @Binding var oneSecond: Double
    
    @State private var offSet: (CGFloat, CGFloat) = (0, 0)
    
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
        let dataPic = Array(0..<tapCount)
//        var offSetAnim = (0, 0)
        
        ZStack {
            VStack {
                ZStack {
                    ProgressView(value: abs(timeRemaining), total: defaultTimeRemain)
                        .progressViewStyle(TimeLineProgressViewStyle(timeRemaining: $timeRemaining))

                    HStack {
                        Text( (tapCount % 3) == 0 ? "+2 seconds" : "")
                            .opacity(tapCount > 0 ? 1.0 : 0.0)
                            .animation(.easeIn(duration: tapCount == 0 ? 0.0 : 0.9))
                    }
                }
               
//                Spacer()
                HStack(alignment: .firstTextBaseline) {
                    LazyHGrid(rows: [GridItem()]) {
                        ForEach(dataPic, id: \.self) { item in
                            HStack {
                                Image("28-3")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .animation(.easeOut)
                            }
                        }
                    }
                }
                .frame(width: screenWidth - 32,
                       height: 40,
                       alignment: .trailing)
//                .padding(.bottom, 12)
                
                Spacer()
            }
            VStack {
                Spacer()
                ZStack {
                    CountdownCircle(countDownTimerActive: $finishGame,
                                    isActiveTimer: $isActiveTimer)
                        .offset(y: -62)
                    //                        .hidden()
                    
                    Image("28-3")
                        .resizable()
                        .frame(width: 100,
                               height: 100)
                        .foregroundColor(.red)
                        .offset(x: offSet.0, y: offSet.1)
                        .shadow(radius: 10 )
                        .opacity(isActiveObject ? 1.0 : 0.0)
                        .onTapGesture {
                            tapCount += 1
                            isActiveObject = false
                            AudioServicesPlaySystemSound(1103) //Sound
                            AudioServicesPlaySystemSound(1351) //Vibe
                            if (tapCount % 3) == 0 {
                                timeRemaining += 2
                                AudioServicesPlaySystemSound(1256)
                            }
                       
                    
                        }
                        .onChange(of: oneSecondFilter) { _ in
                            changeOpacity()
                        }
                }
                Spacer()
            }
        }.onChange(of: isActiveTimer) { _ in
            if hideOnMain {
                playSound(sound: "GameMusic3", type: "mp3")
            } else {
                stopSound()
            }
        }

        .ignoresSafeArea(.all, edges: .bottom)
        .onReceive(mainTimer, perform: { _ in
            onReciveTimer()
        })
    }
    
    func changeOpacity() {
        if isActiveTimer  {
            isActiveObject.toggle()
            offSet = (CGFloat.random(in: -150...150),
                      CGFloat.random(in: -300...320))
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
        GameScreen(hideOnMain: .constant(true), finishGame: .constant(true), goMain: .constant(false), selectLevel: .constant(0.01), tapCount: .constant(23))
    }
}
