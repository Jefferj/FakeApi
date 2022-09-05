//
//  PostsDetail.swift
//  FakeApi
//
//  Created by Jefferson Naranjo rodríguez on 3/09/22.
//

import SwiftUI

struct PostsDetail: View {
    
    @StateObject var jsonTwo = ModelTwoViewModel()
    @StateObject var jsonThree = ModelThreeViewModel()
    
    
    var body: some View {
        if jsonTwo.datosModel.isEmpty {
            ProgressView()
        }else{
            List(jsonTwo.datosModel, id:\.id){ item in
                VStack(alignment: .leading){
                    Text(item.name).font(.title)
                    Text(item.username).font(.subheadline)
                    Text(item.email).font(.subheadline)
                    Text(item.website).font(.subheadline)
                    Text(item.phone).font(.subheadline)
                }
                };List(jsonThree.datosModel, id:\.id){ item in
                    Text(item.body).font(.title)
                
            }.navigationBarTitle("Description")
        }
    }
}

