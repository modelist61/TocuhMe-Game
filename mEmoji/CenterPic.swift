//
//  CenterPic.swift
//  mEmoji
//
//  Created by Dmitry Tokarev on 19.01.2021.
//

import SwiftUI

struct CenterPic: View {
    
    @State private var rotationLogo = false
    
    var body: some View {
        Image("28-3")
            .resizable()
//            .opacity( tapCount > 0 ? 0.0 : 1.0)
            .onAppear(perform: {
                rotationLogo = true
            })
            .rotationEffect(.degrees(rotationLogo ? 720 : 0))
            .animation(.easeIn(duration: 1))    }
}

struct CenterPic_Previews: PreviewProvider {
    static var previews: some View {
        CenterPic()
            .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
