//
//  SearchGame.swift
//  GameStream
//
//  Created by Yussel Coranguez on 12/10/22.
//

import Foundation

class SearchGame: ObservableObject{
    @Published var gameInfo = [Game]()
    
    func search(gameName:String){
        gameInfo.removeAll()
        //Esta peticion recibe parametros y pone espacios en la peticion
        let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "cuphead")")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request){data, response, error in
         do{
             if let jsonData = data{
                 print("Tamaño del json \(jsonData)")
                 let decodeData = try
                 JSONDecoder().decode(Resultados.self, from: jsonData)
                 //Operacion de manera asincrona
                 DispatchQueue.main.async {
                     self.gameInfo.append(contentsOf: decodeData.results)
                 }
             }
         }catch{
             print("Error: \(error)")
         }
         //resume es para que se ejecute la petición
        }.resume()
    }
}
