//
//  ViewModel.swift
//  GameStream
//
//  Created by Yuss on 27/09/22.
//

import Foundation

class ViewModel: ObservableObject{
    @Published var gamesInfo = [Game]()
    
    init(){
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request){data, response, error in
            do{
                if let jsonData = data{
                    print("Tamaño del json \(jsonData)")
                    let decodeData = try
                    JSONDecoder().decode([Game].self, from: jsonData)
                    //Operacion de manera asincrona
                    DispatchQueue.main.async {
                        self.gamesInfo.append(contentsOf: decodeData)
                    }
                }
            }catch{
                print("Error: \(error)")
            }
            //resume es para que se ejecute la petición
        }.resume()
    }
}
