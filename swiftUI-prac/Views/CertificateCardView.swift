//
//  CertificateCardView.swift
//  swiftUI-prac
//
//  Created by Junyu Lin on 9/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import SwiftUI

struct CertificateCardView: View {
    var body: some View {
        VStack{
            HStack (alignment: .top){
                VStack (alignment: .leading){
                    Text("UI Design")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Text("certificate")
                        .font(.body)
                        .foregroundColor(.green)
                }
                .padding(.leading)
                
                Spacer()
                
                Image(systemName: "rosette")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(.top, 4)
                    .padding(.trailing)
                    .foregroundColor(.white)
            
            }
            Spacer()
        }
        .padding(.top)
        .frame(width: 240, height: 150)
        .background(Color.black)
        .clipped()
        .cornerRadius(15)
    }
}

struct CertificateCardView_Previews: PreviewProvider {
    static var previews: some View {
        CertificateCardView()
    }
}
