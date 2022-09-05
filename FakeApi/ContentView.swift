//
//  ContentView.swift
//  FakeApi
//
//  Created by Jefferson Naranjo rodríguez on 1/09/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //The EnvironmentObject is used because it needs to react in all directions, hence the environment and not the observedObject
    @EnvironmentObject var login : PostViewModel

    var body: some View {
        
        Group{
            if login.authenticated == 0 {
                Login()
            }else if login.authenticated == 1 {
                Posts()
            }else if login.authenticated == 2 {
                VStack{
                    Text("Incorrect email or password")
                    Button(action:{
                        login.authenticated = 0
                    }){
                        Text("Return to")
                    }
                }
            }
        }
        
        
    }
    

}
