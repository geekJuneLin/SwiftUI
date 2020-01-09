//
//  CertificateView.swift
//  swiftUI-prac
//
//  Created by Junyu Lin on 9/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import SwiftUI

struct CertificateRow: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            Text("Certificates")
                .font(.title)
                .padding(.leading, 40)
            
            ScrollView (.horizontal, showsIndicators: false){
                HStack (spacing: 20){
                    ForEach(0..<5){ i in
                        CertificateCardView()
                    }
                }
                .padding(.leading, 40)
            }
            .frame(width: UIScreen.main.bounds.width, height: 240)
        }
    }
}

struct CertificateView_Previews: PreviewProvider {
    static var previews: some View {
        CertificateRow()
    }
}
