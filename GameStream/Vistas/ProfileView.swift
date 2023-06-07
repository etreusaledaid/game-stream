//
//  ProfileView.swift
//  GameStream
//
//  Created by Yuss on 14/10/22.
//

import SwiftUI

struct ProfileView: View {
    @State var nombreUsuario = "Lorem"
    @State var imagenPerfil:UIImage = UIImage(named: "perfilEjemplo")!
    
    var body: some View {
        ZStack {
            Color("Marine").ignoresSafeArea().navigationBarHidden(true).navigationBarBackButtonHidden(true)
            VStack{
                Text("Perfil").fontWeight(.bold).foregroundColor(Color.white).frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .center).padding()
                VStack{
                    Image(uiImage: imagenPerfil).resizable().aspectRatio(contentMode: .fill).frame(width: 118, height: 118).clipShape(Circle())
                    Text("\(nombreUsuario)").foregroundColor(.white).fontWeight(.bold)
                }.padding(EdgeInsets(top: 32, leading: 0, bottom: 32, trailing: 0))
                Text("Ajustes").fontWeight(.bold).foregroundColor(Color.white).frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .leading)
                ModuloAjustes()
                Spacer()
            }
        }.onAppear(perform: {
            //Metdo de recuperacion de imagenes
            //validar cuando no hay foto guardada
            if returnUiImage(named: "fotoperfil") != nil {imagenPerfil = returnUiImage(named: "fotoperfil")!
            }else{
                print("no encontre foto de perfil en base de datos")
            }
            print("revisando si tengo datos en user defaults")
            if UserDefaults.standard.object(forKey: "datosUsuario") !=
                nil {
                nombreUsuario = UserDefaults.standard.stringArray(forKey: "datosUsuario")![2]
                print("Si encontre nombre de usuario \(nombreUsuario)")
            }else{
                print("no encontre nombre de usuario guardado en objeto global de userdefaults")
            }
        })
    }
    
    func returnUiImage(named:String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false){
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
}

struct ModuloAjustes:View{
    @State var isToggleOn = false
    @State var isEditProfileViewActive = false
    
    var body: some View{
        VStack(spacing:3){
            Button(action: {}, label: {
                HStack {
                    Text("Cuenta").foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right").foregroundColor(.white)
                }.padding()
            }).background(Color("Blue-Gray")).clipShape(RoundedRectangle(cornerRadius: 1))
            Button(action: {}, label: {
                HStack {
                    Text("Notificaciones").foregroundColor(.white)
                    Spacer()
                    Toggle("",isOn: $isToggleOn)
                }.padding()
            }).background(Color("Blue-Gray")).clipShape(RoundedRectangle(cornerRadius: 1))
            Button(action: {isEditProfileViewActive = true}, label: {
                HStack {
                    Text("Editar Perfil").foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right").foregroundColor(.white)
                }.padding()
            }).background(Color("Blue-Gray")).clipShape(RoundedRectangle(cornerRadius: 1))
            Button(action: {}, label: {
                HStack {
                    Text("Califica esta aplicación").foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right").foregroundColor(.white)
                }.padding()
            }).background(Color("Blue-Gray")).clipShape(RoundedRectangle(cornerRadius: 1))
            NavigationLink(destination: EditProfileView(), isActive: $isEditProfileViewActive, label: {EmptyView()})
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
