//
//  TouchMe.swift
//  mEmoji
//
//  Created by Dmitry Tokarev on 19.01.2021.
//

import SwiftUI

struct TouchMe: View {
    
    @State private var showGameScreen = false
    @State private var finishGame = false
    @State private var showMainScreen = true
    @State private var selectLevel = 0.01
    @State private var takePoints = 0
    
    var body: some View {
        
        ZStack {
            Background().opacity(0.8)
            
            VStack {
                GameScreen(hideOnMain: $showGameScreen,
                           finishGame: $finishGame,
                           goMain: $showMainScreen,
                           selectLevel: $selectLevel,
                           tapCount: $takePoints)
            }
            .opacity( showGameScreen ? 1.0 : 0.0 )
//                .opacity( 1.0 ) // !!!
            VStack {
                Header()
                CenterPic()
                    .frame(width: 250, height: 250)
//                    .opacity(0.1) // !!!
                Spacer()
                HStack(alignment: .center) {
                    Text("\(takePoints) x")
                        .font(.system(size: 50))
                        .fontWeight(.black)
                        .foregroundColor(Color.white)
                        .bold()
                        .shadow(color: .black, radius: 3, x: 2.0, y: 2.0)
                        
                    CenterPic()
                        .frame(width: 50, height: 50)
                        .shadow(color: .black, radius: 3, x: 2.0, y: 2.0)
                }
                .opacity(takePoints > 0 ? 1.0 : 0.0)
                
                Spacer()
                
                VStack(spacing: 15) {
                    LevelButton(myButtonAction: {
                        levelChoosw(difficult: 0.020)
                    }, text: "Easy")
                    
                    LevelButton(myButtonAction: {
                        levelChoosw(difficult: 0.028)
                    }, text: "Medium")
                    
                    LevelButton(myButtonAction: {
                        levelChoosw(difficult: 0.035)
                    }, text: "Hard")
                }
            }.opacity(showMainScreen ? 1.0 : 0.0)
            .animation(.easeInOut)
        }
    }
    func levelChoosw(difficult: Double) {
        finishGame = true
        showGameScreen = true
        showMainScreen = false
        selectLevel = difficult
        takePoints = 0
    }
}

struct TouchMe_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TouchMe()
                .previewDevice("iPhone 11")
        }
    }
}
