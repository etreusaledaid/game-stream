//
//  ContentView.swift
//  GameStream
//
//  Created by Yussel Coranguez on 22/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 19/255, green: 30/255, blue: 56/255, opacity: 1.0).ignoresSafeArea()
                //Color(.blue).ignoresSafeArea()
                VStack{
                    Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 42)
                    InicioYRegistroView()
                }
            }.navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct InicioYRegistroView: View{
    @State var tipoInicioSesion = true
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Button(action: {
                    tipoInicioSesion = true
                    print("pantalla inicio sesion")
                }, label: {Text("INICIA SESIÓN")}).foregroundColor(tipoInicioSesion ? .white : .gray)
                Spacer()
                Button(action: {
                    print("pantalla registrate")
                    tipoInicioSesion = false
                }, label: {Text("REGÍSTRATE")}).foregroundColor(tipoInicioSesion ? .gray : .white)
                Spacer()
            }
            Spacer(minLength: 42)
            if tipoInicioSesion == true{
                InicioSesionView()
            }else{
                RegistroView()
            }
        }
    }
}

struct InicioSesionView: View{
    @State var correo = ""
    @State var password = ""
    @State var isPantallaHomeActive = false

    var body: some View{
        ScrollView {
            VStack(alignment: .leading) {
                Text("Correo electrónico").foregroundColor(Color("Dark-Cian"))
                ZStack(alignment: .leading){
                    if correo.isEmpty{
                        Text(verbatim:"ejemplo@mail.com").font(.caption).foregroundColor(.gray)
                    }
                    TextField("", text: $correo).foregroundColor(.white)
                }
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                Text("Contraseña").foregroundColor(.white)
                ZStack(alignment: .leading){
                    if password.isEmpty{
                    Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                    }
                    SecureField("", text: $password).foregroundColor(.white)
                }
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                Text("¿Olvidaste tu contraseña?").font(.footnote).frame(width: 300, alignment: .trailing).foregroundColor(Color("Dark-Cian")).padding(.bottom)
                Button(action: iniciarSesion, label: {Text("Iniciar sesión").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"), lineWidth: 1.0)).shadow(color: .white, radius: 6)})
                Text("Iniciar sesión con redes sociales").foregroundColor(.white)
                HStack{
                    Button(action: {}, label: {Text("Facebook").foregroundColor(.white).bold().frame( maxWidth: .infinity,  alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).background(RoundedRectangle(cornerRadius: 8).fill(Color("Blue-Gray")))})
                    Button(action: {}, label: {Text("Twitter").foregroundColor(.white).bold().frame( maxWidth: .infinity,  alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).background(RoundedRectangle(cornerRadius: 8).fill(Color("Blue-Gray")))})
                }
            }.padding(.horizontal, 77.0)
        }
        NavigationLink(
            destination: Home(),
            isActive: $isPantallaHomeActive,
            label: {EmptyView()})
    }
    func iniciarSesion(){
        print("Estoy iniciando sesión")
        isPantallaHomeActive = true
    }
}

struct RegistroView: View{
    @State var correo = ""
    @State var password = ""
    @State var confirmarPassword = ""
    
    var body: some View{
        ScrollView {
            VStack(alignment: .center){
                Text("Elije una foto de perfil").fontWeight(.bold).foregroundColor(.white)
                Text("Puedes cambiar o elegirla más adelante").font(.footnote).fontWeight(.light).foregroundColor(.gray).padding(.bottom)
                Button(action: tomarFoto, label: {
                    ZStack{
                        Image("perfilEjemplo").resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80)
                        Image(systemName: "camera").foregroundColor(.white)
                    }
                }).padding(.bottom)
            }
            
            VStack{
                VStack(alignment: .leading) {
                    Text("Correo electrónico*").foregroundColor(Color("Dark-Cian"))
                    ZStack(alignment: .leading){
                        if correo.isEmpty{
                            Text(verbatim:"ejemplo@mail.com").font(.caption).foregroundColor(.gray)
                        }
                        TextField("", text: $correo).foregroundColor(.white)
                    }
                    Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                    Text("Contraseña").foregroundColor(.white).frame(width: 300, alignment: .leading)
                    ZStack(alignment: .leading){
                        if password.isEmpty{
                        Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                        }
                        SecureField("", text: $password).foregroundColor(.white)
                    }
                    Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                    Text("confirmar contraseña").foregroundColor(.white)
                    ZStack(alignment: .leading){
                        if password.isEmpty{
                            Text("Vuelve a escribir tu contraseña").font(.caption).foregroundColor(.gray)
                        }
                        SecureField("", text: $confirmarPassword).foregroundColor(.white)
                    }
                    Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                }
                Button(action: registrate, label: {Text("Regístrate").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"), lineWidth: 1.0)).shadow(color: .white, radius: 6)})
                Text("Iniciar sesión con redes sociales").foregroundColor(.white)
                HStack{
                    Button(action: {}, label: {Text("Facebook").foregroundColor(.white).bold().frame( maxWidth: .infinity,  alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).background(RoundedRectangle(cornerRadius: 8).fill(Color("Blue-Gray")))})
                    Button(action: {}, label: {Text("Twitter").foregroundColor(.white).bold().frame( maxWidth: .infinity,  alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).background(RoundedRectangle(cornerRadius: 8).fill(Color("Blue-Gray")))})
                }
            }.padding(.horizontal, 77.0)
        }
    }
}

func tomarFoto(){
    print("Tomar foto")
}

func registrate(){
    print("Registrado")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //Image("pantalla02").resizable()
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
