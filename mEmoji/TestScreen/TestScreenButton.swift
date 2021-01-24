//
//  TestScreenButton.swift
//  mEmoji
//
//  Created by Dmitry Tokarev on 09.01.2021.
//

import SwiftUI

struct TestScreenButton: View {
    
    let buttonAction: () -> Void
    let text: String
    
    var body: some View {
        
        
        
        Button(action: buttonAction) {
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

struct TestScreenButton_Previews: PreviewProvider {
    static var previews: some View {
        TestScreenButton(buttonAction: {}, text: "123")
    }
}
