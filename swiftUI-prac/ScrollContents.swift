//
//  ScrollContents.swift
//  swiftUI-prac
//
//  Created by Junyu Lin on 9/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import SwiftUI

struct ScrollContents: View {
    var colors: [String] = [String](arrayLiteral: "yellow","yellow",
    "yellow","yellow","yellow")
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView (.vertical){
                CardRow(colors: self.colors)
                
                CertificateRow()
                CertificateRow()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct ScrollContents_Previews: PreviewProvider {
    static var previews: some View {
        ScrollContents()
    }
}
