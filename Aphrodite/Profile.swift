//
//  Search.swift
//  Aphrodite
//
//  Created by Arteezy on 8/27/21.
//

import SwiftUI
import AuthenticationServices
import FBSDKLoginKit

struct Profile: View {
    
    let filterBy: Array<String> = ["Artist","Genre","Discograph Ran"]
    let genres: Array<String> = [""]
    
    var body: some View {
        ZStack{
            backgroundImage
            VStack{
                Spacer()
                Text("Welcome")
                    .font(.largeTitle)
                    .bold()
                Text("Music is what feelings sound like!")
                    .font(.caption)
                Spacer()
                LoginWithFacebook()
                signInWithApple
                signInWithEmail
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
    var signInWithEmail: some View {
        HStack{
            Image(systemName: "envelope.fill")
            Text("Sign In with Email").bold()
        }
        .foregroundColor(.black)
        .animation(.easeInOut)
        .frame(width: AuthButtonSize.widthAuth, height: AuthButtonSize.heightAuth, alignment: .center)
        .background(Color .white)
        .cornerRadius(5)
        .padding()
    }
    
    var signInWithApple: some View {
        SignInWithAppleButton(.signIn, onRequest: configure, onCompletion: handle)
            .animation(.easeInOut)
            .signInWithAppleButtonStyle(.white)
            .frame(width: AuthButtonSize.widthAuth, height: AuthButtonSize.heightAuth, alignment: .center)
            .cornerRadius(5)
            .padding()
    }
    func configure(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.email,.fullName]
    }
    func handle(_ authResult: Result<ASAuthorization,Error>){
        switch authResult{
        case .success(let auth):
            switch auth.credential{
            case let appleIdCredentials as  ASAuthorizationAppleIDCredential:
                if let appleUser = AppleUser(credentials: appleIdCredentials),
                let appleUserData = try? JSONEncoder().encode(appleUser) {
                    UserDefaults.standard.setValue(appleUserData, forKey: "AppleUser")
                    
                    print("Saved AppleUser: \(appleUser)")
                }
            default:
                print(auth.credential)
            }

            
        case .failure(let error):
            print("Error while apple sign in: \(error)")
        }
    }
    var backgroundImage: some View {
        Image("login").resizable().blur(radius: 0).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .ignoresSafeArea(.all)
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
