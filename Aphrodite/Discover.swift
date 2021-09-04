//
//  Discover.swift
//  Aphrodite
//
//  Created by Arteezy on 8/26/21.
//

import SwiftUI

struct Discover: View {
    
    let placeHolderTitles = ["Artist Showcase","Fall in Love","Socialize","Rock And Roll"]
    let placeHolderImages = ["Paul2","L2","G","R"]
    
    var body: some View {

            ZStack{
                Color.darkBlue
                    .ignoresSafeArea(.all)
                ScrollView(.vertical,showsIndicators: false){
                    VStack(alignment: .leading,spacing: 0){
                        Text("Discover")
                            .bold()
                            .padding([.horizontal])
                            .font(.largeTitle)
                        Divider()
                        Featured.padding([.vertical])
                        Divider()
                        PopularArtists.padding([.vertical])
                        Divider()
                        BestReviews.padding([.vertical])
                        Divider()
                        BestDiscographies.padding([.vertical])
                        Spacer()
                    }
                }.foregroundColor(.white)
            }
    }
    
    @ViewBuilder
    func SingleReviewFunc(reviwerName: String, reviwerImage: String, albumImage: String, albumName: String,artistName: String,genre: String,releaseDate: String,reviewTitle: String,likes:String,comments: String) -> some View {
        
        VStack(alignment: .leading,spacing: 10){
            HStack{
                Image(reviwerImage).resizable().clipShape(Circle()).frame(width: 25, height: 25, alignment: .center)
                Text(reviwerName).font(.body)
                Spacer()
            }
            .padding(.horizontal,3)
            .frame(width: 300, height: 30, alignment: .center)
            .background(Color.black)
            
            HStack{
                Image(albumImage)
                    .resizable()
                    .frame(width: 100, height: 100)
                Spacer()
                VStack(alignment: .trailing){
                    Text(albumName)
                    Text(artistName)
                    Text(genre)
                    Text(releaseDate)
                }
                .frame(width: 150, height: 100)
                .background(Color .black)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            
            HStack{
                VStack(alignment: .leading,spacing: 5){
                    Text(reviewTitle).bold()
                    
                    HStack(spacing: 2){
                        Text("Rating: ").bold()
                        ForEach(0..<5){ _ in
                            Image(systemName: "star.fill").foregroundColor(.lightBlue)
                        }
                    }
                }
                Spacer()
                VStack(spacing: 5){
                    HStack{
                        Text(likes)
                        Image(systemName: "hand.thumbsup")
                    }
                    
                    HStack{
                        Text(comments)
                        Image(systemName: "text.bubble")
                    }
                }
            }.padding([.horizontal,.bottom])
            



        }
        .frame(width: 300, height: 200, alignment: .center)
        .background(Color .black)
        
        
        
    }
    
    
    @ViewBuilder
    func SingleArtistForDiscography(artistName: String,imageName: String) -> some View {
        VStack{
            ZStack(alignment: .bottom){
                Image(imageName).resizable().frame(width: FeaturedSize.width, height: FeaturedSize.height, alignment: .center)
                HStack{
                    Spacer()
                    Text(artistName)
                        .bold()
                        .font(.title3)
                    Spacer()
                }.padding(.horizontal)
                
                .background(Color .black)
                .foregroundColor(.white)
            }
        }
        .cornerRadius(5)
        .frame(width: FeaturedSize.width, height: FeaturedSize.height, alignment: .center)
        .padding([.trailing],10)
        
    }
    
    var BestDiscographies: some View {
        VStack(alignment: .leading){
            Text("Highly Rated Discographies")
                .font(.title2)
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    SingleArtistForDiscography(artistName: "Bruce Springsteen", imageName: "Bruce")
                    
                    SingleArtistForDiscography(artistName: "Micheal Jackson", imageName: "King_Of_Pop")
                    
                    SingleArtistForDiscography(artistName: "Bob Dylan", imageName: "Bob_Dylan")
                    
                    SingleArtistForDiscography(artistName: "The Rolling Stones", imageName: "Rolling_Stones")
                }
            }
        }.padding(.horizontal)
    }
    
    var BestReviews: some View {
        
        VStack{
            HStack{
                Text("Best Reviews")
                    .font(.title2)
                Spacer()
                Text("See All")
                    .foregroundColor(.pink)
            }
            
            
            ScrollView(.horizontal,showsIndicators: false){
                
                
                let layoutReviews = [GridItem(.flexible(minimum: 225, maximum: 300)),GridItem(.flexible(minimum: 225, maximum: 300))]
                
                LazyHGrid(rows: layoutReviews, spacing: 25){
                        ForEach(0..<2){ _ in
                    
                            SingleReviewFunc(reviwerName: "Aubrey Graham", reviwerImage: "Drake", albumImage: "Solar_Power", albumName: "Solar Power", artistName: "Lorde", genre: "Pop", releaseDate: "08/20/21", reviewTitle: "She's Back!!", likes: "321", comments: "102")

                            SingleReviewFunc(reviwerName: "Jennifer", reviwerImage: "Jay", albumImage: "BOY_Album", albumName: "Mutual Friends", artistName: "BOY", genre: "Indie", releaseDate: "02/26/11", reviewTitle: "Hidden Treasure", likes: "15", comments: "45")

                            SingleReviewFunc(reviwerName: "Linda", reviwerImage: "Linda", albumImage: "Blonde_On_Blonde", albumName: "Blonde On Blonde", artistName: "Bob Dylan", genre: "Rock", releaseDate: "06/20/1966", reviewTitle: "Classic", likes: "91", comments: "67")
                        }
                }


            }

        }.padding(.horizontal)
        
    }
    var PopularArtists: some View {
         
        VStack{
            HStack{
                Text("Popular Artists")
                    .font(.title2)
                Spacer()
                Text("See All")
                    .foregroundColor(.pink)
            }
            
            let layout = [
                GridItem(.flexible(minimum: 150, maximum: 165)),
                GridItem(.flexible(minimum: 150, maximum: 165))
            ]

            ScrollView(.horizontal,showsIndicators: false){
                LazyHGrid(rows: layout,spacing: 25){
                    ForEach(0..<16){_ in
                        VStack(spacing: 0){
                            Image("Paul")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 125, height: 125, alignment: .center)
                            Text("Paul Mccartney")
                                .padding([.top],5)
                                .font(.body)
                                .padding(.horizontal)
                        }
                        .frame(width: 150, height: 165, alignment: .center)
                    }
                }
            }
        }.padding(.horizontal)
    }
    var Featured: some View {
        VStack(alignment: .leading){
            Text("Featured")
                .font(.title2)
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(0..<placeHolderTitles.count){ index in
                        VStack(alignment: .leading){
                            Text(placeHolderTitles[index])
                                .font(.caption)
                                .padding([.bottom],1)
                            VStack{
                                ZStack(alignment: .bottom){
                                    Image(placeHolderImages[index])
                                        .resizable()
                                        .frame(width: FeaturedSize.width, height: FeaturedSize.height, alignment: .center)
                                }
                            }.cornerRadius(5)
                            
                             .frame(width: FeaturedSize.width, height: FeaturedSize.height, alignment: .center)
                            .padding([.trailing],10)
                        }
   
                    }
                }
            }
            
        }.padding([.horizontal])
    }
    struct FeaturedSize{
        static let width: CGFloat = 230
        static let height: CGFloat = 280
    }
}






struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover()
    }
}


