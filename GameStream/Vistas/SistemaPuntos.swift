//
//  SistemaPuntos.swift
//  GameStream
//
//  Created by Yuss on 20/10/22.
//

import SwiftUI

struct SistemaPuntos: View {
    var body: some View {
        Rectangle().frame(width: 100, height: 100, alignment: .center).foregroundColor(.blue)    }
}

struct SistemaPuntos_Previews: PreviewProvider {
    static var previews: some View {
        SistemaPuntos()
        SistemaPuntos()
            .previewDevice("iPhone 11")
        
        SistemaPuntos()
            .previewDevice("iPad Pro (9.7-inch)")
    }
}
