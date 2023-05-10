//
//  GameView.swift
//  GameStream
//
//  Created by Yussel Coranguez on 05/10/22.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    var url: String
    var titulo: String
    var estudio: String
    var calificacion: String
    var anoPublicacion: String
    var descripcion: String
    var tags: [String]
    var imgsUrl: [String]
    
    var body: some View {
        ZStack{
            Color("Marine").ignoresSafeArea()
            VStack{
                video(url:url).frame(height:200)
                ScrollView{
                    videoInfo(titulo:titulo,estudio:estudio,calificacion:calificacion,anoPublicacion:anoPublicacion,descripcion:descripcion,tags:tags).padding(.bottom)
                    gallery(imgUrl:imgsUrl)
                    comentarios()
                    similares()
                }.frame(maxWidth: .infinity)
            }
        }
    }
}

struct video: View{
    var url:String
    
    var body: some View{
        VideoPlayer(player: AVPlayer(url: URL(string: url)!)).ignoresSafeArea()
    }
}

struct videoInfo: View{
    var titulo: String
    var estudio: String
    var calificacion: String
    var anoPublicacion: String
    var descripcion: String
    var tags: [String]
    
    var body: some View{
        VStack(alignment: .leading){
            Text("\(titulo)").foregroundColor(.white).font(.largeTitle).padding(.leading)
            HStack{
                Text("\(estudio)").foregroundColor(.white).font(.subheadline).padding(.top,5)
                Text("\(calificacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top,5)
                
                Text("\(anoPublicacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top,5)
            }
            Text("\(descripcion)")
                 .foregroundColor(.white)
                 .font(.subheadline)
                 .padding(.top,5)
                 .padding(.leading)
             HStack{
                 ForEach(tags, id:\.self){
                     tag in
                     Text("#\(tag)")
                         .foregroundColor(.white)
                         .font(.subheadline)
                         .padding(.top,4)
                         .padding(.leading)
                 }
             }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct gallery: View{
    var imgUrl:[String]
    let formGrid = [
        GridItem(.flexible())
    ]
    
    var body: some View{
        VStack(alignment: .leading){
            Text("Galeria").foregroundColor(.white).font(.largeTitle).padding(.leading)
            ScrollView(.horizontal){
                LazyHGrid(rows:formGrid, spacing: 8){
                    ForEach(imgUrl,id:\.self){
                        //Desplegar imagenes del servidor con la url
                        imgUrl in
                        KFImage(URL(string: imgUrl)).resizable().aspectRatio(contentMode: .fill)
                    }
                }
            }.frame(height: 180)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct comentarios: View{
    var comentario:[[String]] = [["Geoff Atto","Hace 7 días","He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades"],["Ali Baack","Hace 12 días","He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades."]]
    
    var body: some View{
        VStack(alignment: .leading){
            Text("Comentarios").foregroundColor(.white).font(.largeTitle).padding(.leading)
            ForEach(comentario, id:\.self){
                comentarios in
                ZStack{
                    RoundedRectangle(cornerRadius: 8).fill(Color("Blue-Gray")).padding(10)
                    VStack{
                        HStack{
                            Image("perfilEjemplo").resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 40, height: 40, alignment: .leading)
                                                    .padding([.top,.leading],15)
                            Text("\(comentarios[0])").foregroundColor(.white).font(.title3).frame(maxWidth: .infinity, alignment: .trailing).padding(.top,10)
                            Text("\(comentarios[1])").foregroundColor(.white).font(.subheadline).frame(maxWidth: .infinity, alignment: .leading).padding(.top,10)
                        }
                        Text("\(comentarios[2])").foregroundColor(.white).padding([.leading,.trailing,.bottom],15)
                    }
                }
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct similares: View{
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
        @State var isPlayerActive = false
        let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View{
        VStack(alignment: .leading){
            Text("Juegos similares").foregroundColor(.white).font(.largeTitle).padding(.leading)
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    Button(action: {url = urlVideos[4]
                        isPlayerActive = true}, label: {
                        Image("destiny_complete").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                    Button(action: {url = urlVideos[5]
                        isPlayerActive = true}, label: {
                        Image("farcry4").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                    Button(action: {url = urlVideos[6]
                        isPlayerActive = true}, label: {
                        Image("lastofus").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                }
            }
            Color.clear.frame(width: 1, height: 8, alignment: .center)
        }
        NavigationLink(
            destination: VideoPlayer(player: AVPlayer(url: URL(string: url)!)).frame(width: 400, height: 300),
            isActive: $isPlayerActive,
            label: {EmptyView()})
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(url: "Ejemplo.com", titulo: "Sonic", estudio: "Sega", calificacion: "E+", anoPublicacion: "1991", descripcion: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente", tags: ["plataformas","mascota"], imgsUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])
    }
}
