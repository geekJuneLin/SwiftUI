//
//  TopView.swift
//  swiftUI-prac
//
//  Created by Junyu Lin on 9/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import SwiftUI

struct CardRow: View {
    var colors: [String]
    
    var body: some View {
        VStack(alignment: .leading){
            // Title
            VStack (alignment: .leading){
                Text("Courses")
                    .font(.largeTitle)
                    .bold()
                Text("21 courses")
                    .font(.body)
                    .foregroundColor(Color.gray)
            }
            .padding(.leading, 70)
            
            // top view
            ScrollView (.horizontal, showsIndicators: false){
                HStack (spacing: 20) {
                    ForEach(0..<self.colors.count){ i in
                        GeometryReader{ geometry in
                            Cardview()
                                .rotation3DEffect(Angle(degrees: Double((geometry.frame(in: .global).minX) - 40) / -20), axis: (x: 0, y: 10.0, z: 0))
                        }
                        .frame(width: 240, height: 350)
                    }
                }
                .padding(40)
            }
            .frame(width: UIScreen.main.bounds.width, height: 460)
        }
        .padding(.top, 120)
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        CardRow(colors: [String](arrayLiteral: "yellow","yellow",
        "yellow","yellow","yellow"))
    }
}
