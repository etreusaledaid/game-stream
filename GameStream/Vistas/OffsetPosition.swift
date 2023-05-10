//
//  OffsetPosition.swift
//  GameStream
//
//  Created by Yussel Coranguez on 27/10/22.
//

import SwiftUI

struct OffsetPosition: View {
    var body: some View {
        /*VStack{
            Offsets()
            Positions()
        }*/
        GeometryReader(content: {geometry in
        VStack{
            Image("perfilEjemplo").resizable().aspectRatio(contentMode: .fit).frame(width: geometry.size.width, height: geometry.size.height)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            })
    }
}

struct Offsets: View{
    var body: some View{
        Image("perfilEjemplo").resizable().aspectRatio(contentMode: .fit).frame(width: 200, height: 200).offset(x: 18, y: 20)
        Text("Platzi").foregroundColor(.blue).bold()
    }
}

struct Positions: View{
    var body: some View{
        VStack{
            Image("perfilEjemplo").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100)
            Text("")
        }
    }
}

struct OffsetPosition_Previews: PreviewProvider {
    static var previews: some View {
        OffsetPosition()
    }
}
