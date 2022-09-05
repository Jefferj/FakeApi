//
//  Posts.swift
//  FakeApi
//
//  Created by Jefferson Naranjo rodríguez on 3/09/22.
//

import SwiftUI

struct Posts: View {
    @EnvironmentObject var login : PostViewModel
    @StateObject var json = ModelOneViewModel()
    var body: some View {
        
        NavigationView{
            if json.datosModel.isEmpty {
                ProgressView()
            }else{
                VStack(alignment: .leading){
                List{
                    ForEach(json.datosModel, id:\.id){ cell in
                        NavigationLink(destination: PostsDetail()){
                            
                                Text("\(cell.title)")
                            
                        }
                    }.onDelete { IndexSet in
                        json.datosModel.remove(atOffsets: IndexSet)
                    
                        
                    }
                    
                        
                    }.navigationBarTitle("POSTS")
                        
                }
                    
            }
                
        }
        
    }
    
}
