//
//  TestScreenHeaderLogo.swift
//  mEmoji
//
//  Created by Dmitry Tokarev on 14.01.2021.
//

import SwiftUI

struct TestScreenHeaderLogo: View {
    var body: some View {
        VStack {
            Image("backgroundDonutPic")
                .resizable()
                .ignoresSafeArea()
                .frame(height: 150)
            Image("headerPic")
                .resizable()
                .frame(width: 350, height: 80, alignment: .bottom)
                .offset(x: 0, y: -20)
        }
    }
}

struct TestScreenHeaderLogo_Previews: PreviewProvider {
    static var previews: some View {
        TestScreenHeaderLogo()
    }
}
