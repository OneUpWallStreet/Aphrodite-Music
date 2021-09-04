//
//  LoginWithFacebook.swift
//  Aphrodite
//
//  Created by Arteezy on 8/28/21.
//

import SwiftUI
import FBSDKLoginKit

struct LoginWithFacebook: View {
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @AppStorage("email") var email = ""
    @State var manager = LoginManager()

    var body: some View {
        Button{
            if isLoggedIn == false{
                manager.logOut()
                isLoggedIn = true
                email = ""
            }
            else{
                manager.logIn(permissions: ["public_profile","email"], from: nil) { (result, err) in
                    
                    if err != nil {
                        print("Something went wrong in request? \(err!.localizedDescription)")
                        return
                    }
                    else{
                        isLoggedIn = true
                        let request = GraphRequest(graphPath: "me", parameters: ["fields": "id, email, name, picture.type(large)"])
                        print("Have request? \(request)")
                        request.start{(_,res,_) in
                            guard let profileData = res as? [String: Any] else {return}
                            print("Profile Data: \(profileData)")
                            email = profileData["email"] as! String
                        }
                    }
                }
            }
        }label: {
            HStack{
                Image("fb3").resizable().frame(width: 30, height: 30, alignment: .center)
                Text("Sign In Facebook")
                    .bold()
            }
            .frame(width: AuthButtonSize.widthAuth, height: AuthButtonSize.heightAuth, alignment: .center)
            .background(Color .white)
            .foregroundColor(.black)
            .cornerRadius(5)
            .padding()
        }
    }
}

struct LoginWithFacebook_Previews: PreviewProvider {
    static var previews: some View {
        LoginWithFacebook()
    }
}
