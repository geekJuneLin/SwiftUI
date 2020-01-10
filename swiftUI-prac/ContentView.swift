//
//  ContentView.swift
//  swiftUI-prac
//
//  Created by Junyu Lin on 8/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import SwiftUI

struct RoundedCorners: View {
    var color: Color = .blue
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0

    var body: some View {
        GeometryReader { geometry in
            Path { path in

                let w = geometry.size.width
                let h = geometry.size.height

                // Make sure we do not exceed the size of the rectangle
                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)

                path.move(to: CGPoint(x: w / 2.0, y: 0))
                path.addLine(to: CGPoint(x: w - tr, y: 0))
                path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h - br))
                path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
            }
            .fill(self.color)
        }
    }
}

struct ContentView: View {
    @State var isMenuPresented = false
    
    
    fileprivate func NavButtons() -> some View {
        return VStack{
            HStack(spacing: 12){
                // menu button
                Button(action: {
                    withAnimation{
                        self.isMenuPresented.toggle()
                    }
                }, label: {
                    ZStack{
                        Image(systemName: "line.horizontal.3")
                            .font(.system(size: 25))
                            .foregroundColor(.gray)
                    }
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
    
    var body: some View {
        
        ZStack (alignment: .leading){
            // scroll content
            ScrollContents()
            
            NavButtons()
            
            BlurView(style: .light)
                .onTapGesture {
                    withAnimation{
                        self.isMenuPresented.toggle()
                    }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .opacity(self.isMenuPresented ? 1 : 0)
            .animation(.easeInOut)

            VStack{
                Text("Menu bar")
            }
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.95)
            .background(Color.white)
            .clipped()
            .cornerRadius(50)
            .offset(x: self.isMenuPresented ? 0 : -UIScreen.main.bounds.width, y: UIScreen.main.bounds.height * 0.025)
            .rotation3DEffect(Angle(degrees: self.isMenuPresented ? 0 : 60), axis: (x: 0, y: self.isMenuPresented ? 40 : 0, z: 0))
            .animation(.easeIn)

            
        }
        .background(Color.backgroundGray)
        .edgesIgnoringSafeArea(.all)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color{
    static var backgroundGray = Color(red: 237/255, green: 237/255, blue: 237/255)
}
