//
//  PostViewModel.swift
//  FakeApi
//
//  Created by Jefferson Naranjo rodríguez on 2/09/22.
//

import Foundation

class PostViewModel: ObservableObject {
    
    @Published var authenticated = 0
    
    init() {
        if let session = UserDefaults.standard.object(forKey: "session") as? Int {
            authenticated = session
        }else{
            authenticated = 2
        }
    }


func login(email: String, password: String){
    guard let url = URL(string: "https://reqres.in/api/login") else { return }
    let parameters = ["email":email,"password":password]
    let body = try! JSONSerialization.data(withJSONObject: parameters)
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = body
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    URLSession.shared.dataTask(with: request){data,response,error in
        if let response = response {
            print(response)
        }
        
        guard let data = data else { return }
        do{
            let datos = try JSONDecoder().decode(PostModel.self, from: data)
            if !datos.token.isEmpty{
                DispatchQueue.main.async {
                    self.authenticated = 1
                    UserDefaults.standard.setValue(1, forKey: "session")
                }
            }
        }catch let error as NSError{
            print("Error making post", error.localizedDescription)
            DispatchQueue.main.async {
                self.authenticated = 2
            }
        }
        
    }.resume()
    
   }
}
