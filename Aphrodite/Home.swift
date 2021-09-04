//
//  Home.swift
//  Aphrodite
//
//  Created by Arteezy on 8/25/21.
//

import SwiftUI

struct Home: View {
    @Environment(\.colorScheme) var colorScheme
    
    let placeHolderImages = ["Blonde_On_Blonde","Darkness","Led_Zeppelin_4","Solar_Power"]
    let placeHolderNames =   ["Bob Dylan","Bruce Springsteen & The E-Street Band And Bruce Springsteen of course","Led Zeppelin","Lorde"]

    var body: some View {
        ZStack{
            Color.darkBlue
                .ignoresSafeArea(.all)

            ScrollView(showsIndicators: false){
                VStack(alignment: .leading,spacing: 0){
                    Text("Home").bold().padding([.horizontal]).font(.largeTitle)
                    Divider()
                    ArtistOfTheDay.padding([.top])
                    Divider()
                    MostActiveDiscussions.padding([.top])
                    Divider()
                    MultipleReviews.padding([.top])
                    Divider()
                    NewMusic.padding([.top])
                    Spacer()
                    
                }
            }.foregroundColor(.white)
            
        }
    }
    var NewMusic: some View {
        VStack{
            HStack{
                Text("New Music")
                    .font(.title2)
                
                Spacer()
                
                Text("Sell All")
                    .foregroundColor(.pink)
                
            }
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(0..<placeHolderImages.count){ imageIndex in
                        VStack(alignment: .leading){
                            HStack{
                                Spacer()
                                Image(placeHolderImages[imageIndex])
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    
                                Spacer()
                            }
                            .padding(.top)

                            VStack(alignment: .leading){
                                Text(placeHolderImages[imageIndex])
                                    .font(.body)
                                Text(placeHolderNames[imageIndex])
                                    .font(.caption)
                            }.padding([.horizontal],10)

                        }
                        .frame(width: 150, height: 180, alignment: .center)
                        .background(Color .black)
                        .cornerRadius(5)
                        .padding([.horizontal],1)
                        .border(Color.lightBlue, width: 2)
                    }
                }

            }
        }
        .padding([.horizontal])
    }
    
    var MultipleReviews: some View {
        
        VStack(alignment: .leading){
            
            HStack{
                Text("Connected Reviews")
                    .font(.title2)
                Spacer()
                Text("See All")
                    .foregroundColor(.pink)
            }
            .padding(.horizontal)
            ForEach(0..<2){ _ in
                SingleReview
            }
        }
        
    }
    var SingleReview: some View {
        
        VStack{
            VStack(alignment: .leading){
                HStack{
                    Image("Linda")
                        .resizable()
                        .clipShape(Rectangle())
                        .cornerRadius(5)
                        .border(Color.white, width: 1)
                        .frame(width: 30, height: 30).padding([.leading],3)
                    Text("Eddard Stark Reviewed")
                    Spacer()
                }
                .padding([.vertical],5)
                .background(Color .black)
                .foregroundColor(.white)
                
                HStack{
                    
                    Image("BOY_Album")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Spacer()
                    VStack(alignment: .leading){
//                        Text("Album: Mutual Friends")
//                        Text("Artist: BOY")
//                        Text("Genre: Indie")
//                        Text("Release Date: 02/26/11")
                        Text("Mutual Friends")
                        Text("BOY")
                        Text("Indie")
                        Text("02/26/11")
                    }
                    .frame(width: 150, height: 100)
                    .background(Color .black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    Spacer()
                    
                    
                }
                
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut ")
                    Button{
                        print("Read MOre Pressed")
                    }label: {
                        Text("Read More").italic()
                    }
            }
            .padding()
            .border(Color.lightBlue, width: 2)
            
        }
        .padding([.horizontal])
        
        
        
    }
    var ReviewsForArtistsFollowed: some View {
        VStack(alignment: .leading){
            Text("Reviews for Followed Artists").font(.title2)
            
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]){
                    ForEach(0..<4){ _ in
                        VStack(spacing: 0){
                            HStack{
                                Image("Ned")
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 25, height: 25)
                                
                                Text("Eddard").font(.body)
                                Spacer()
                            }
                            .foregroundColor(.white)
                            .background(Color .black)
                            .cornerRadius(3)
                            .frame(width: 200, height: 30)
                            

                            
                            Image("BOY_Album").resizable().frame(width: 150, height: 150)
                        }
                    }
                }
                        
        }.padding([.horizontal])
        
        
    }
    var ArtistOfTheDay: some View {
        
        VStack(alignment: .leading){
            
            HStack{
                Text("Artist Of The Day")
                    .font(.title2)
                Spacer()
                Text("Details")
                    .foregroundColor(.pink)
                
            }
            ZStack(alignment: .bottom){
            Image("BOY").resizable().frame(width: 350, height: 250).cornerRadius(10)
            HStack{
                Text("BOY").font(.body).bold()
                Spacer()
                Text("Indie")
            }
            .padding([.horizontal,.top,.bottom],10)
            .foregroundColor(.white).background(Color .black)
            }
            
            
            
        }
        .padding([.horizontal])
        
    }
    var MostActiveDiscussions: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Most Active Discussions")
                    .font(.title2)
                Spacer()
                Text("See All")
                    .foregroundColor(.pink)
            }
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(0..<5){ _ in
                        VStack{
                            Text("Whats the best led zepplin album?")
                            HStack(spacing: 0){
                                Text("5").font(.subheadline).bold()
                                Image("Like").resizable().frame(width: 30, height: 30)
                                Spacer()
                                Text("15").font(.subheadline).bold()
                                Image(systemName: "bubble.right").padding([.leading],5)
                            }.padding(.horizontal)
                        }
                        .frame(width: 250, height: 100, alignment: .center)
                        .border(Color.lightBlue, width: 2)
                        .cornerRadius(3)
                        
                    }
                }
                
            }
        }.padding(.horizontal)
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
