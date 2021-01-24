//
//  Header.swift
//  mEmoji
//
//  Created by Dmitry Tokarev on 19.01.2021.
//

import SwiftUI

struct Header: View {
    
    @State private var zoomLogo = false
    
    var body: some View {
        
        
        VStack {
            Image("backgroundDonutPic")
                .resizable()
                .ignoresSafeArea()
                .frame(height: 150)
            Image("headerPic")
                .resizable()
                .frame(width: 350, height: 70, alignment: .bottom)
                .offset(x: 0, y: -10)
                .onAppear(perform: {
                    zoomLogo = true
                })
                .scaleEffect(zoomLogo ? 1.0 : 0.1)
                .animation(.easeOut(duration: 1.0))
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Header()
            Spacer()
        }
        
    }
}
