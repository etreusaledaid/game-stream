//
//  FavoritesView.swift
//  GameStream
//
//  Created by Yussel Coranguez on 13/10/22.
//

import SwiftUI
import AVKit

struct FavoritesView: View {
    @ObservedObject var todosLosVideojuegos = ViewModel()
    
    var body: some View {
        ZStack{
            Color("Marine").ignoresSafeArea()
            VStack{
                Text("Favoritos").font(.title2).fontWeight(.bold).foregroundColor(.white).padding(.bottom,9)
                ScrollView{
                    ForEach(todosLosVideojuegos.gamesInfo, id: \.self){
                        juego in
                        VStack(spacing: 0){
                            VideoPlayer(player: AVPlayer(url: URL(string: juego.videosUrls.mobile)!)).frame(height: 300)
                            Text("\(juego.title)").foregroundColor(.white).padding().frame(maxWidth: .infinity, alignment: .leading).background(Color("Blue-Gray")).clipShape(RoundedRectangle(cornerRadius: 3))
                        }
                    }
                }.padding(.bottom,8)
            }.padding(.horizontal,6)
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
