//
//  NavigationButtons.swift
//  swiftUI-prac
//
//  Created by Junyu Lin on 9/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import SwiftUI

struct NavigationButtons: View {
    
    @State var isMenuPresented = false
    
    var body: some View {
        VStack{
            HStack(spacing: 12){
                // menu button
                Button(action: {
                    self.isMenuPresented.toggle()
                }, label: {
                    ZStack{
                        Image(systemName: "line.horizontal.3")
                            .font(.system(size: 25))
                            .foregroundColor(.gray)
                    }
                }).sheet(isPresented: $isMenuPresented, content: {
                    MenuView()
                })
                .frame(width: 60, height: 60)
                .background(RoundedCorners(color: .white, tl: 0, tr: 50, bl: 0, br: 50))
                
                Spacer()
                
                // profile button
                Button(action: {
                    print("profile button pressed")
                }, label: {
                    Image(systemName: "person.circle")
                    .frame(width: 50, height: 50)
                    .background(RoundedCorners(color: .white, tl: 25, tr: 25, bl: 25, br: 25))
                    .font(.system(size: 25))
                    .foregroundColor(.gray)
                })
                    
                
                // bell button
                Button(action: {
                    print("profile button pressed")
                }, label: {
                    Image(systemName: "bell.circle")
                    .frame(width: 50, height: 50)
                    .background(RoundedCorners(color: .white, tl: 25, tr: 25, bl: 25, br: 25))
                    .font(.system(size: 25))
                    .foregroundColor(.gray)
                })
                
            }
            .padding(.trailing, 12)
            .frame(width: UIScreen.main.bounds.width, height: 200)
            Spacer()
        }
        .padding(.top, 50)
    }
}

struct NavigationButtons_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButtons(isMenuPresented: false)
    }
}
