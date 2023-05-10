//
//  GamesView.swift
//  GameStream
//
//  Created by Yussel Coranguez on 27/09/22.
//

//API
//https://gamestream-api.herokuapp.com/

import SwiftUI
import Kingfisher

struct GamesView: View {
    @ObservedObject var todosLosVideojuegos = ViewModel()
    
    @State var gameviewIsActive: Bool = false
    @State var url: String = ""
    @State var titulo: String = ""
    @State var estudio: String = ""
    @State var calificacion: String = ""
    @State var anoPublicacion: String = ""
    @State var descripcion: String = ""
    @State var tags: [String] = [""]
    @State var imgsUrl: [String] = [""]
    
    let formaGrid = [
        GridItem(.flexible()),GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack{
            Color("Marine").ignoresSafeArea()
            VStack{
                Text("Juegos").font(.title2).fontWeight(.bold).foregroundColor(.white).padding(EdgeInsets(top: 16, leading: 0, bottom: 44, trailing: 0))
                ScrollView{
                    LazyVGrid(columns: formaGrid, spacing: 8){
                        ForEach(todosLosVideojuegos.gamesInfo,id: \.self){
                            juego in
                            Button(action: {
                                url = juego.videosUrls.mobile
                                titulo = juego.title
                                estudio = juego.studio
                                calificacion = juego.contentRaiting
                                anoPublicacion = juego.publicationYear
                                descripcion = juego.description
                                tags = juego.tags
                                imgsUrl = juego.galleryImages
                                
                                print("Pulse el juego\(juego.title)")
                                
                                gameviewIsActive = true
                                
                            }, label: {
                                //Funciona para mostrar una imagen a traves de una url
                                KFImage(URL(string: juego.galleryImages[0])!).resizable().aspectRatio(contentMode: .fit).clipShape(RoundedRectangle.init(cornerRadius: 4)).padding(.bottom,12)
                            })
                        }
                    }
                }
            }.padding(.horizontal,6)
            NavigationLink(
                destination: GameView(url: url, titulo: titulo, estudio: estudio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl),
                isActive: $gameviewIsActive,
                label: {
                    EmptyView()
                })
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
                perform:{
                //onAppear funciona para ejecutar este codigo en cuando inicializa
                print("Primer elemento de json: \(todosLosVideojuegos.gamesInfo[0])")
                print("Titulo del primer video juego del json \(todosLosVideojuegos.gamesInfo[0].title)")
                }
            )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
