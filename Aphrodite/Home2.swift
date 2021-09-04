//
//  Home2.swift
//  Aphrodite
//
//  Created by Arteezy on 8/29/21.
//

import SwiftUI

struct Home2: View {
    @State var showingPop = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical){
                Divider()
                VStack{
                    showcase
                        .padding(.horizontal)
                    Divider()
                    addPost
                        .padding(.horizontal)
                    allPosts
                }
            }
            .navigationTitle("Home")
        }
        
    }
    
    var allPosts: some View {
        VStack{
            CustomDivider()
            singlePost
                .padding(.horizontal)
            CustomDivider()
            singlePostfunc(imageName: "Bob_Dylan", name: "Steve Jobs", context: "I think Every album that Bob Dylan releases is a 10/10 classic", cat: "Artist Review", status: "Positive")
                .padding(.horizontal)
            CustomDivider()
            singlePostfunc(imageName: "Jay", name: "Jay-Z", context: "Blueprint is such a good album, dont you think so?", cat: "Album Review", status: "Positive")
                .padding(.horizontal)
            CustomDivider()
        }
    }
    
    
    @ViewBuilder
    func singlePostfunc(imageName: String, name: String,context: String,cat: String, status: String) -> some View{
        VStack(alignment: .leading,spacing: 10){
            HStack{
                Image(imageName)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40, alignment: .center)
                Text(name)
                    .font(.headline)
                Spacer()
                
                Image(systemName: "ellipsis")
                    .font(.headline)
            }
        
            HStack{
                if colorScheme == .dark{
                    Text(cat)
                        .padding(10)
                        .background(Color .white)
                        .foregroundColor(.black)
                        .cornerRadius(5)
                }
                else{
                    Text(cat)
                        .padding(10)
                        .background(Color .black)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }

                HStack{
                    Image(systemName: "star")
                    Text(status)
                }
                .foregroundColor(.white)
                .padding(10)
                .background(Color .pink)
                Spacer()
            }
            
            VStack(alignment: .leading){
                Text(context)
            }
            
            HStack{
                HStack{
                    Image(systemName: "hand.thumbsup")
                    Text("53 Likes")
                }
                
                Spacer()
                
                HStack{
                    Image(systemName: "bubble.left")
                    Text("23 Comments")
                }
                
            }.font(.footnote)

            
            
        }
        
        
        
    }
    
    var singlePost: some View {
        VStack(alignment: .leading,spacing: 10){
            HStack{
                Image("Linda")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40, alignment: .center)
                Text("Linda Ronstadt")
                    .font(.headline)
                Spacer()
                
                Image(systemName: "ellipsis")
                    .font(.headline)
            }
        
            HStack{
                
                if colorScheme == .dark{
                    Text("Album Review")
                        .padding(10)
                        .background(Color .white)
                        .foregroundColor(.black)
                        .cornerRadius(5)
                }
                else{
                    Text("Album Review")
                        .padding(10)
                        .background(Color .black)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
                HStack{
                    Image(systemName: "star")
                    Text("Positive")
                }
                .foregroundColor(.white)
                .padding(10)
                .background(Color .pink)
                Spacer()
            }
            
            VStack(alignment: .leading){
                Text("Lorem ipsum dolor sit amet, cons adipiscing elit, sed do eiusmod tempor incididunt ut")
            }
            
            HStack{
                HStack{
                    Image(systemName: "hand.thumbsup")
                    Text("53 Likes")
                }
                
                Spacer()
                
                HStack{
                    Image(systemName: "bubble.left")
                    Text("23 Comments")
                }
                
            }.font(.footnote)

            
            
        }
        
        
    }
    
    var addPost: some View {
        VStack{
            
            Button{
                print("Create Post Pressed")
                showingPop = true
            }label: {
                HStack{
                    Image(systemName: "mail")
                    Text("Create Post")
                }
                
            }
            .frame(width: 340, height: 50, alignment: .center)
            .background(Color .lightGray)
            .cornerRadius(10)
            .popover(isPresented: $showingPop) {
                CreatePost()
//                Text("Your content here")
//                    .font(.headline)
//                    .padding()
            }
        }
        
    }
    var singleShowcase: some View {
        VStack(alignment: .leading,spacing: 5){
            Text("Artist of the Day").foregroundColor(.gray)
            
            ZStack(alignment: .bottom){
                Image("Bruce")
                    .resizable()
                    .frame(width: 250, height: 300, alignment: .center)
                HStack{
                    Spacer()
                    Text("Bruce Springsteen")
                    Spacer()
                }.frame(width: 250, height: 50, alignment: .center).background(Color .black).foregroundColor(.white)
                
            }.frame(width: 250, height: 300, alignment: .center)
            .cornerRadius(10)
        }
    }
    
    var singleShowcase2: some View {
        VStack(alignment: .leading,spacing: 5){
            Text("Still Fresh").foregroundColor(.gray)
            
            ZStack(alignment: .bottom){
                Image("King_Of_Pop")
                    .resizable()
                    .frame(width: 250, height: 300, alignment: .center)
                HStack{
                    Spacer()
                    Text("Micheal Jackson")
                    Spacer()
                }.frame(width: 250, height: 50, alignment: .center).background(Color .black).foregroundColor(.white)
                
            }.frame(width: 250, height: 300, alignment: .center)
            .cornerRadius(10)
        }
    }
    
    var showcase: some View {
        VStack(alignment: .leading,spacing: 5){
            Text("Showcase").bold().font(.title)
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 25){
                    singleShowcase
                    singleShowcase2
//                    singleShowcase
                }
                
            }
        }.padding([.bottom],5)
    }
}


struct Home2_Previews: PreviewProvider {
    static var previews: some View {
        Home2()
            .preferredColorScheme(.dark)
    }
}
