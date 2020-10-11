//
//  AuthView.swift
//  Capstone
//
//  Created by Alan David Kumaran on 2020-10-09.
//  Copyright © 2020 Shaggy Bremnath. All rights reserved.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

// SIGN IN VIEW //

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    
    func signIn() {
        session.signIn(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                NetDietTrackerTitle()
                EmailTextField(email: $email)
                PasswordSecureField(password: $password)
                Button(action: signIn) {
                    LoginButtonContent()
                }
                
                if (error != "") {
                    Text(error)
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                
                Spacer()
                
                NavigationLink(destination: SignUpView()) {
                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(.black)
                        
                        Text("Sign Up")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                }
        }
            .padding(10)
        }
    }
}

// SIGN UP VIEW //

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var name: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    
    func signUp() {
        session.signUp(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.system(size: 32, weight: .heavy))
                .offset()
                .padding(1)
            
            Text("It's quick and easy")
                .font(.system(size: 18, weight: .medium))
                .offset()
                .padding(1)
            
            EmailTextField(email: $email)
            PasswordSecureField(password: $password)
        }
    }
}

// AUTH VIEW //

struct AuthView: View {
    var body: some View {
        NavigationView {
            SignInView()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView().environmentObject(SessionStore())
    }
}

// SUBVIEW STRUCTS //

struct NetDietTrackerTitle: View {
    var body: some View {
            Text("victu")
                .foregroundColor(Color.black)
                .font(.custom("Southampton", size: 170.0))
                .padding(.bottom, 25)
                .offset(y: 0)
    }
}

// Special Thanks to Karin for the Name and the Font.

struct TintOverlay: View {
  var body: some View {
    ZStack {
      Text(" ")
    }
    .frame(minWidth: 750, maxWidth: .infinity, minHeight: 1100, maxHeight: .infinity)
    .background(Color.black)
        
  }
}


//struct Background: View {
//    var body: some View {
//        NetDietTrackerTitle()
//            .background(
//                Image("userImage")
//                    .resizable()
//                    .scaledToFit()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 450, height: 1000)
//                    .overlay(TintOverlay().opacity(0.10))
//                    .edgesIgnoringSafeArea(.all)
//                    .offset(x: -750, y: -50))
//
//    }
//}

struct LoginButtonContent: View {
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.black)
            .cornerRadius(35.0)
            .offset(y: 80)
    }
}

struct EmailTextField: View {
    @Binding var email: String
    var body: some View {
        TextField("Email", text: $email)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(15.0)
            .padding(.bottom, 20)
            .offset(y: 80)
            .padding(.horizontal, 20)
    }
}

struct PasswordSecureField: View {
    @Binding var password: String
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(15.0)
            .padding(.bottom, 50)
            .offset(y: 80)
            .padding(.horizontal, 20)
    }
}
