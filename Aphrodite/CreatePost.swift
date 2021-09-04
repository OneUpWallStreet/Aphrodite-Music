//
//  CreatePost.swift
//  Aphrodite
//
//  Created by Arteezy on 8/29/21.
//

import SwiftUI

struct CreatePost: View {
    
    @State var cats: Array<String> = ["Album Review","Artist Review","New Music Thread","Artist Discography", "Artist's Best Album"]
    
    @State var title: String = ""
    @State var mainArea: String = "Main TextField"
    
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                Text("What's on your mind")
                    .font(.title)
                    .bold()
                Spacer()
            }
            ScrollView(.horizontal){
                HStack{
                    ForEach(cats, id: \.self){ cat in
                        Text(cat)
                            .font(.caption)
                            .padding(10)
                            .background(Color.darkBlue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            Text("Title")
                .font(.title2)
                .bold()
            TextField("Title", text: $title)
                .border(Color.black)
            TextEditor(text: $mainArea)
                .frame(width: 340, height: 200, alignment: .center)
                .border(Color.black)
            Spacer()
        }.padding(.horizontal)
        
    }
}

struct CreatePost_Previews: PreviewProvider {
    static var previews: some View {
        CreatePost()
    }
}
