//
//  Discover2.swift
//  Aphrodite
//
//  Created by Arteezy on 8/29/21.
//

import SwiftUI

struct Discover2: View {
    
    let categories = ["Album Review","Artist Review","New Music Thread","Artist Discography","Artist's Best Album","Album of the Week"]
    
    let categoriesImages = ["music.note.list","music.mic","newspaper","square.stack","star","music.quarternote.3"]
    
    var body: some View{
    
        NavigationView{
            ScrollView(.vertical){
                VStack(alignment: .leading){
                    Divider()
                    featured
                    Divider()
                    currentPopular
                    Divider()
                    topCategories
                    Divider()
                    bestReviews
                }
                .padding(.horizontal)
            }.navigationTitle("Discover")
        }

    }

        
    @ViewBuilder
    func singleReview(imageName: String) -> some View {
        VStack(alignment: .leading){
            HStack{
                Image(imageName)
                    .resizable()
                    .frame(width: 120, height: 120, alignment: .center)
                    .cornerRadius(2)
                
                VStack(alignment: .leading){
                    Spacer()
                    Text("Mutual Friends")
                        .font(.body)
                    Text("BOY")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("Indie")
                    Text("02/26/11")
                    HStack{
                        ForEach(0..<5){ _ in
                            Image(systemName: "star.fill")
                        }
                    }
                    Spacer()
                }
                .font(.footnote)
                .frame(width: 120, height: 120, alignment: .center)
                Spacer()
            }
            Text("What a Fantastic ablum from Valeska Steiner and Sonja Glass!")
                .bold()
            Spacer()
            HStack{
                HStack(spacing: 2){
                    Image(systemName: "hand.thumbsup")
                    Text("53 Likes")
                }
                HStack(spacing: 2){
                    Image(systemName: "bubble.left")
                    Text("23 Comments")
                }
                Spacer()
                HStack(spacing: 2){
                    Image(systemName: "person")
                    Text("OneUpWallStreet")
                }
            }
            .font(.caption)
            Spacer()
        }
        .padding([.horizontal],5)
        .frame(width: 320, height: 220, alignment: .center)
        .background(Color .lightGray)
        .cornerRadius(5)
        
    }
    
    var bestReviews: some View {
        
        VStack(alignment: .leading){
            HStack{
                Text("Best Reviews")
                    .font(.title2)
                    .bold()
                Spacer()
                Text("See All")
                    .foregroundColor(.blue)
            }
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    
                    singleReview(imageName: "BOY_Album")
                    singleReview(imageName: "Solar_Power")
                    singleReview(imageName: "Blood_On_The_Tracks")
                    singleReview(imageName: "Blonde_On_Blonde")
                    singleReview(imageName: "Darkness")
                    singleReview(imageName: "Led_Zeppelin_4")
                }
            }
        }
    }
    
    var topCategories: some View {
        
        VStack(alignment: .leading){
            HStack{
                Text("Top Categories")
                    .font(.title2)
                    .bold()
                Spacer()
                Text("See All")
                    .foregroundColor(.blue)
            }
            .padding([.bottom],5)
            
            ForEach(0..<categories.count){ index in
                HStack{
                    Image(systemName: categoriesImages[index])
                        .padding(.trailing)
                    VStack(alignment: .leading){
                        Text(categories[index])
                        if index != categories.count - 1 {
                            Divider()
                        }
                        
                    }

                    Spacer()
                }.font(.title3)
            }
            

            
        }
    }
    
    @ViewBuilder
    func singleFeatureFunc(top: String,middle: String,bottom: String,imageName: String) -> some View {
        
        VStack(alignment: .leading,spacing: 5){
            Text(top)
                .font(.headline)
                .foregroundColor(Color .gray)
            Text(middle)
                .font(.title3)
            Text(bottom)
                .font(.title3)
                .foregroundColor(.gray)
            Image(imageName)
                .resizable()
                .frame(width: 320, height: 230, alignment: .center)
        }.cornerRadius(5)
        
    }
    
    
    @ViewBuilder
    func singleArtistFunc(imageName: String,artistName: String,genre: String) -> some View {
        
        VStack{
            HStack{
                Image(imageName)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .frame(width: 60, height: 60, alignment: .center)
                
                VStack(alignment: .leading){
                    Text(artistName)
                        .font(.body)
                    Text(genre)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                VStack{
                    Image(systemName: "music.mic")
                    Text("More").font(.footnote)
                }
                
            }
            .frame(width: 280, height: 60, alignment: .center)
            
            Divider()
        }

    }
    var currentPopular: some View {
        VStack{
            HStack{
                Text("Trending Artists")
                    .font(.title2)
                    .bold()
                Spacer()
                
                Text("See All")
                    .foregroundColor(.blue)
            }
            
            let trendingRows = [
                GridItem(.flexible(minimum: dimensions.minimumArtist, maximum: dimensions.maximumArtist)),
                GridItem(.flexible(minimum: dimensions.minimumArtist, maximum: dimensions.maximumArtist)),
                GridItem(.flexible(minimum: dimensions.minimumArtist, maximum: dimensions.maximumArtist))
            ]

            ScrollView(.horizontal,showsIndicators: false){
                LazyHGrid(rows: trendingRows,spacing: 25){
                    ForEach(0..<3){ _ in
                        singleArtistFunc(imageName: "Paul", artistName: "Paul Mccartney", genre: "Rock")
                        
                        singleArtistFunc(imageName: "Bob_Dylan", artistName: "Bob Dylan", genre: "Rock")
                        
                        singleArtistFunc(imageName: "Linda", artistName: "Linda Ronstadt", genre: "Rock")
                        
                        singleArtistFunc(imageName: "Rolling_Stones", artistName: "The Rolling Stones", genre: "Rock & Roll")
                        
                        singleArtistFunc(imageName: "BOY", artistName: "BOY", genre: "Pop/Indie")
                        
                        singleArtistFunc(imageName: "Bruce", artistName: "Bruce Springsteen", genre: "Rock & Roll")
                    }
                }
            }
        }
    }
    
        
    var featured: some View {
        
        ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 10){
                    singleFeatureFunc(top: "New Album", middle: "The Dark Side of The Moon", bottom: "Pink Floyd", imageName: "dark_side_of_the_moon")
                        
                    singleFeatureFunc(top: "Artist of the Week", middle: "Rock & Roll", bottom: "Led Zeppelin", imageName: "led")
                }

            }
            
        
        
    }
 
    struct dimensions {
        static let minimumArtist: CGFloat = 70
        static let maximumArtist: CGFloat = 270
    }
    
}


struct Discover2_Previews: PreviewProvider {
    static var previews: some View {
        Discover2()
//            .preferredColorScheme(.dark)
    }
}
