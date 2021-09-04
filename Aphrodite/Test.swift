//
//  Test.swift
//  Aphrodite
//
//  Created by Arteezy on 8/26/21.
//

import SwiftUI

struct Test: View {
    var body: some View {

            NavigationView{
                ZStack{
                    Color.darkBlue
                        .ignoresSafeArea(.all)
                    ScrollView(.vertical){
                        ForEach(0..<200){ _ in
                            Text("Dsadas")
                        }
                    }.navigationTitle("Hello")
                    
                }.foregroundColor(.white)
                

            }
        

        
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
