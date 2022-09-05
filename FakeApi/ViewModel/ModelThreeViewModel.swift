//
//  ModelThreeViewModel.swift
//  FakeApi
//
//  Created by Jefferson Naranjo rodríguez on 4/09/22.
//

import Foundation

class ModelThreeViewModel: ObservableObject {
    @Published var datosModel : [ModelThree] = []
    
    init() {
        fetch()
    }
    
    func fetch(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else{ return }
        
        URLSession.shared.dataTask(with: url){data,_,_ in
            guard let data = data else { return }
            do{
                let json = try JSONDecoder().decode([ModelThree].self, from: data)
                DispatchQueue.main.async {
                    self.datosModel = json
                }
            }catch{
                print("Error in JSON")
            }
        }.resume()
    }
}
