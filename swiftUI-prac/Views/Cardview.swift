//
//  Cardview.swift
//  swiftUI-prac
//
//  Created by Junyu Lin on 8/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import SwiftUI

struct Cardview: View {
    var body: some View {
        HStack (alignment: .top){
            VStack (alignment: .leading){
                VStack (alignment: .leading){
                    // description
                    Text("Build an app with SwiftUI")
                        .bold()
                        .lineLimit(2)
                        .frame(width: 200)
                        .font(.title)
                        .foregroundColor(.white)
                    
                    // image
                    Image("course")
                        .resizable()
                        .frame(width: 180, height: 160)
                    .padding()
                }
                
                Spacer()
            }
            .padding(.top, 20)
        }
        .frame(width: 240, height: 350)
        .background(Color.blue)
        .clipped()
        .cornerRadius(30)
        .shadow(color: Color.blue.opacity(0.5), radius: 10, y: 10)
    }
}

struct Cardview_Previews: PreviewProvider {
    static var previews: some View {
        Cardview()
    }
}
