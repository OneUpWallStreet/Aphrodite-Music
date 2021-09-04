//
//  ContentView.swift
//  Aphrodite
//
//  Created by Arteezy on 8/25/21.
//

import SwiftUI

struct ContentView: View {

    
    var body: some View {
        TabView{

            
            Home2()
                .tag("home")
                .tabItem {
                    VStack{
                        Image(systemName: "house")
                        Text("Home").font(.caption)
                    }
                }
            
            Discover2()
                .tag("discover")
                .tabItem {
                    VStack{
                        Image(systemName: "star")
                        Text("Discover").font(.caption)
                    }
                }
            
            Search()
                .tag("search")
                .tabItem {
                    VStack{
                        Image(systemName: "magnifyingglass")
                        Text("Search").font(.caption)
                    }
                }
//            Discover2()
            MusicBoard()
                .tag("discover")
                .tabItem {
                    VStack{
                        Image(systemName: "pencil.and.outline")
                        Text("Music Board").font(.caption)
                    }
                }
            
            Profile()
                .tag("discover")
                .tabItem {
                    VStack{
                        Image(systemName: "person.crop.circle")
                        Text("Profile").font(.caption)
                    }
                }
        }
        
    }
}

