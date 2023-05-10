//
//  GameStreamApp.swift
//  GameStream
//
//  Created by Yussel Coranguez on 22/09/22.
//

import SwiftUI

@main
/**
 @main: especifica que la estructura va a ser el punto de inicio de la app.
 App protocol: Se encarga de inicializar el grupo de ventanas que conformaran nuestra app. Dentro de las ventanas se agregan vistas
 init + main y App: El codigo que se va a ejecutar siempre al comenzar la vida de una app iOS
 
 Los estados del ScenePhase
 Active: La app se encuentra en foreground y el usuario puede interactuar con ella.
 Inactive: La app se encuentra en foreground pero se debe pausar lo que este haciendo (ej reproducir musica).
 Background: La app no es visible para el usuario y no puede interactuar con ella.
 */
struct GameStreamApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.onChange(of: scenePhase, perform: {phase in
            print(phase)
            if(phase == .inactive){
                print("App inactiva")
            }
        })
    }
}
