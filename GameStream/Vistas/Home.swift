//
//  Home.swift
//  GameStream
//
//  Created by Yussel Coranguez on 26/09/22.
//

import SwiftUI
import AVKit

struct Home: View {
    @State var tabSeleccionado:Int = 2
    
    var body: some View {
        TabView(selection: $tabSeleccionado) {
            ProfileView().font(.system(size: 30, weight: .bold, design: .rounded)).tabItem{
                Image(systemName: "person")
                Text("Perfil")
            }.tag(0)
            GamesView().font(.system(size: 30, weight: .bold, design: .rounded)).tabItem{
                Image(systemName: "gamecontroller")
                Text("Juegos")
            }.tag(1)
           PantallaHome().tabItem{
                Image(systemName: "house")
                Text("Inicio")
           }.tag(2)
            FavoritesView().font(.system(size: 30, weight: .bold, design: .rounded)).tabItem{
                Image(systemName: "heart")
                Text("Favoritos")
            }.tag(3)
        }.accentColor(.white)
    }
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor(Color("TabBarColor"))
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().isTranslucent = true

        print("Iniciando vistas de home")
    }
}

struct PantallaHome:View{
    
    var body: some View{
        ZStack {
            Color("Marine").ignoresSafeArea()
            VStack {
                Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.horizontal, 11)
                ScrollView(showsIndicators: false){                            SubModuloHome()                            }//.clipped()
            }.padding(.horizontal,18)
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
    
    /*func busqueda(){
        print("El usuario busca \(textoBusqueda)")
    }*/
}

struct SubModuloHome:View{
    @ObservedObject var juegoEncontrado = SearchGame()
    @State var isGameViewActive = false
    @State var url: String = ""
    @State var titulo: String = ""
    @State var estudio: String = ""
    @State var calificacion: String = ""
    @State var anoPublicacion: String = ""
    @State var descripcion: String = ""
    @State var tags: [String] = [""]
    @State var imgsUrl: [String] = [""]
    
    //Variable para diferente dispositivo
    var dispositivo = UIDevice.current.model
    
    @State var isGameInfoEmpty = false
    @State var textoBusqueda = ""
    /*@State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
        @State var isPlayerActive = false
        let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]*/
    
    var body: some View{
        VStack{
            HStack{
                Button(action: {watchGame(name:textoBusqueda)}, label: {
                    Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color.yellow : Color("Dark-Cian"))
                }).alert(isPresented: $isGameInfoEmpty){
                    Alert(title: Text("Error"), message: Text("No se encontro el juego"), dismissButton: .default(Text("Entendido")))
                }
                ZStack(alignment: .leading){
                    if textoBusqueda.isEmpty{
                        Text("Buscar un video en \(dispositivo)").foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                    }
                    TextField("",text: $textoBusqueda).foregroundColor(.white)
                }
            }.padding([.top,.leading,.bottom],11.0).background(Color("Blue-Gray")).clipShape(Capsule())
            Text("Los más populares").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top)
            ZStack{
                Button(action: {
                    watchGame(name:"The witcher")}, label: {
                        VStack(spacing: 0){
                            Image("thewitcher").resizable().scaledToFit()
                            Text("The witcher").frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).background(Color("Blue-Gray"))
                        }
                    })
                Image(systemName: "play.circle.fill").resizable().foregroundColor(.white).frame(width: 42, height: 42)
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical)
            Text("Categorías sugeridas para tí").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    if(dispositivo == "iPad"){
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8).fill(Color("Blue-Gray")).frame(width: 320, height: 180)
                                Image("fps").resizable().scaledToFit().frame(width: 84, height: 84)
                            }
                        })
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8).fill(Color("Blue-Gray")).frame(width: 320, height: 180)
                                Image("rpg").resizable().scaledToFit().frame(width: 83, height: 84)
                            }
                        })
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8).fill(Color("Blue-Gray")).frame(width: 320, height: 180)
                                Image("openworld").resizable().scaledToFit().frame(width: 84, height: 84)
                            }
                        })
                    }else{
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8).fill(Color("Blue-Gray")).frame(width: 160, height: 90)
                                Image("fps").resizable().scaledToFit().frame(width: 42, height: 42)
                            }
                        })
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8).fill(Color("Blue-Gray")).frame(width: 160, height: 90)
                                Image("rpg").resizable().scaledToFit().frame(width: 42, height: 42)
                            }
                        })
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8).fill(Color("Blue-Gray")).frame(width: 160, height: 90)
                                Image("openworld").resizable().scaledToFit().frame(width: 42, height: 42)
                            }
                        })
                    }
                }
            }
            Text("Recomendados para tí").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    Button(action: {
                        watchGame(name:"spiderman")
                    }, label: {
                        Image("spiderman").resizable().scaledToFit().frame(width: 240, height: 235)
                    })
                    Button(action: {
                        watchGame(name:"uncharted4")
                    }, label: {
                        Image("uncharted4").resizable().scaledToFit().frame(width: 240, height: 235)
                    })
                    Button(action: {
                        watchGame(name:"assassins_creed")
                    }, label: {
                        Image("assassins_creed").resizable().scaledToFit().frame(width: 240, height: 235)
                    })
                }
            }
            Text("VIDEOS QUE PODRIAN GUSTARTE").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                       
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    Button(action: {watchGame(name:"destiny_complete")}, label: {
                        Image("destiny_complete").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                    Button(action: {watchGame(name:"farcry4")}, label: {
                        Image("farcry4").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                    Button(action: {watchGame(name: "lastofus")}, label: {
                        Image("lastofus").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                }
            }
            Color.clear.frame(width: 1, height: 8, alignment: .center)
        }
        NavigationLink(
            destination: GameView(url: url, titulo: titulo, estudio: estudio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl),
            isActive: $isGameViewActive,
            label: {EmptyView()})
    }
    
    func watchGame(name:String){
        juegoEncontrado.search(gameName: name)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3){
            print("Cantidad E:\(juegoEncontrado.gameInfo.count)")
            if juegoEncontrado.gameInfo.count == 0{
                isGameInfoEmpty = true
            }else{
                url = juegoEncontrado.gameInfo[0].videosUrls.mobile
                titulo = juegoEncontrado.gameInfo[0].title
                estudio = juegoEncontrado.gameInfo[0].studio
                calificacion = juegoEncontrado.gameInfo[0].contentRaiting
                anoPublicacion = juegoEncontrado.gameInfo[0].publicationYear
                descripcion = juegoEncontrado.gameInfo[0].description
                tags = juegoEncontrado.gameInfo[0].tags
                imgsUrl = juegoEncontrado.gameInfo[0].galleryImages
                
                isGameViewActive = true
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Home()
            Home()
        }
    }
}
