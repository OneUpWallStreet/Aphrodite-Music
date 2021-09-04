//
//  MusicBoard.swift
//  Aphrodite
//
//  Created by Arteezy on 8/27/21.
//

import SwiftUI

struct MusicBoard: View {
    
    @State var name: String = ""
    
    let tags: Array<String> = ["Album","Artist","Discography","Song","UnderRated","Overrated"]
    
    var body: some View {
        ZStack{
            
            Color.darkBlue
                .ignoresSafeArea(.all)
            
            
                ScrollView(.vertical,showsIndicators: false){
                    VStack(alignment: .leading,spacing: 3){
                        HStack{
                            Text("MusicBoard")
                                .bold()
                                .padding(.horizontal)
                                .font(.largeTitle)
                            Spacer()
                        }
                        Divider()
                        placeholderPosts(title: "Top")
                        Divider()
                        placeholderPosts(title: "Contraversial")
                        Divider()
                        placeholderPosts(title: "Rising")
                        Divider()
                        placeholderPosts(title: "New")
                        
                        
                    Spacer()
                    }
                }
        }.foregroundColor(.white)
    }
    
    
    @ViewBuilder
    
    func placeholderPosts(title: String) -> some View {
        
        VStack(alignment: .leading,spacing: 0){
            Text(title)
                .font(.title2)
            ScrollView(.horizontal){
                let layoutTopposts = [GridItem(.flexible(minimum: 220, maximum: 270)),GridItem(.flexible(minimum: 220, maximum: 270))]
                LazyHGrid(rows: layoutTopposts,spacing: 25){
                    ForEach(0..<6){_ in
                      post
                    }
                }
            }
        }.padding(.horizontal)
    }
    
    
    var topposts: some View {
        VStack(alignment: .leading){
            Text("Top Posts")
                .font(.title2)
            ScrollView(.horizontal){
                let layoutTopposts = [GridItem(.flexible(minimum: 225, maximum: 275)),GridItem(.flexible(minimum: 225, maximum: 275))]
                LazyHGrid(rows: layoutTopposts,spacing: 25){
                    ForEach(0..<6){_ in
                      post
                    }
                }
            }
        }.padding(.horizontal)
        

        
    }
    var post: some View {
        VStack(alignment: .leading){
            HStack{
                Image("Linda")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 20, height: 20, alignment: .center)
                    .padding(.leading)
                Text("Linda")
                
                Spacer()
                VStack{
                    Image(systemName: "plus")
                    Text("Follow").font(.caption2)
                }
                .padding(.trailing)
                .font(.caption)
            }.padding([.vertical],3)
            
            VStack(alignment: .leading,spacing: 10){
                Text("Is Stairway to Heavan the greatest song of all time? If not that whats your choice??")
                HStack{
                    VStack(spacing: 5){
                        HStack{
                            Image(systemName: "hand.thumbsup")
                            Text("5 people liked this")
                            Spacer()
                        }
                        
                        HStack{
                            Image(systemName: "text.bubble")
                            Text("32 comments ")
                            Spacer()
                        }
                    }
                    .font(.caption)
                    Spacer()
                    Text("Song")
                        .padding(10)
                        .foregroundColor(.black)
                        .background(Color .mediumBlue)
                        .cornerRadius(10)
                }
            }.padding(.horizontal)
        }
        .frame(width: 250, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color .black)
        
    }
    var filterBoard: some View {
        VStack{
            Text("Filter Using Tags")
                .font(.title2)
            HStack{
//                ForEach("")
                Text("hello")
            }
        }
    }
    
    
}

struct MusicBoard_Previews: PreviewProvider {
    static var previews: some View {
        MusicBoard()
    }
}
