//
//  Button.swift
//  mEmoji
//
//  Created by Dmitry Tokarev on 19.01.2021.
//

import SwiftUI

struct LevelButton: View {
    
    let myButtonAction: () -> Void
    let text: String
    
    var body: some View {

        Button(action: myButtonAction) {
            Text(text)
                .font(.title2)
                .frame(width: 150, height: 60, alignment: .center)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(30)
                .shadow(color: .black, radius: 5, x: 3, y: 3)
        }
    }
}

struct LevelButton_Previews: PreviewProvider {
    static var previews: some View {
        LevelButton(myButtonAction: {}, text: "Easy")
    }
}
