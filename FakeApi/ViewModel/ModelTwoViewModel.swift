//
//  ModelTwoViewModel.swift
//  FakeApi
//
//  Created by Jefferson Naranjo rodríguez on 3/09/22.
//

import Foundation

class ModelTwoViewModel: ObservableObject {
    @Published var datosModel : [ModelTwo] = []
    
    init() {
        fetch()
    }
    
    func fetch(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else{ return }
        
        URLSession.shared.dataTask(with: url){data,_,_ in
            guard let data = data else { return }
            do{
                let json = try JSONDecoder().decode([ModelTwo].self, from: data)
                DispatchQueue.main.async {
                    self.datosModel = json
                }
            }catch{
                print("Error in JSON")
            }
        }.resume()
    }
}
