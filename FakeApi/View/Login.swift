//
//  Login.swift
//  FakeApi
//
//  Created by Jefferson Naranjo rodríguez on 3/09/22.
//

import SwiftUI

struct Login: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var login : PostViewModel
    var body: some View {
        ZStack{
            Color("Background").edgesIgnoringSafeArea(.all)
            VStack{
                Text("Welcome")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                TextField("Email", text: $email)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                
                Button(action:{
                    login.login(email: email, password: password)
                }){
                    Text("Sign In")
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color("BackgroundButton"))
                        .cornerRadius(10)
                }

            }.padding(.all)
        }
    }
}


