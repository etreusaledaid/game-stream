//
//  EditProfileView.swift
//  GameStream
//
//  Created by Yuss on 14/10/22.
//

import SwiftUI

struct EditProfileView: View{
    @State var imagenPerfil:Image? = Image("perfilEjemplo")
    @State var isCameraActive = false
    
    var body: some View {
        ZStack {
            Color("Marine").ignoresSafeArea()
            ScrollView {
                VStack {
                    Button(action: {isCameraActive = true}, label: {
                        ZStack {
                            //Image("perfilEjemplo")
                            imagenPerfil!.resizable().aspectRatio(contentMode: .fill).frame(width: 118, height: 118).clipShape(Circle()).sheet(isPresented: $isCameraActive, content: {
                                SUImagePickerView(sourceType: .photoLibrary, image: self.$imagenPerfil, isPresented: $isCameraActive)
                            })
                            Image(systemName: "camera").foregroundColor(.white)
                        }
                    })
                }.padding(.bottom,18)
                ModuloEditar()
            }
        }
    }
}

struct ModuloEditar:View{
    @State var correo:String = ""
    @State var contraseña:String = ""
    @State var nombre:String = ""
    
    var body: some View{
        VStack(alignment: .leading){
            Text("Correo electronico").foregroundColor(Color("Dark-Cian"))
            ZStack(alignment: .leading){
                if correo.isEmpty{
                    Text(verbatim: "Ejemplo@email.com").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1))
                }
                TextField("", text: $correo).foregroundColor(.white)
            }
            Divider().frame(height: 1).background(Color("Dark-Cian"))
            
            Text("Contraseña").foregroundColor(Color("Dark-Cian"))
            ZStack(alignment: .leading){
                if contraseña.isEmpty{
                    Text(verbatim: "Introduce tu contraseña").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1))
                }
                SecureField("", text: $contraseña).foregroundColor(.white).foregroundColor(.white)
            }
            Divider().frame(height: 1).background(Color("Dark-Cian"))
            
            Text("Nombre").foregroundColor(Color("Dark-Cian"))
            ZStack(alignment: .leading){
                if nombre.isEmpty{
                    Text(verbatim: "Introduce tu nombre de usuario").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1))
                }
                TextField("", text: $nombre).foregroundColor(.white)
            }
            Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom, 32)
            
            Button(action: {actualizarDatos()}, label: {Text("Actualizar datos").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"), lineWidth: 1.0)).shadow(color: .white, radius: 6)}).padding(.bottom)
        }.padding(.horizontal,42)
    }
    
    func actualizarDatos(){
        let objetoActualizarDatos = SaveData()
        let resultado = objetoActualizarDatos.guardarDatos(correo: correo, contraseña: contraseña, nombre: nombre)
        print("Se guardaron los datos con exito \(resultado)")
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
