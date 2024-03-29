//
//  SignInView.swift
//  ShopApp
//
//  Created by Демьян Горчаков on 21.03.2023.
//

import SwiftUI

struct SignInView: View {
    
    let fbManager = FirebaseManager()
    
    @EnvironmentObject var signInObject: SignInObject
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack{
            VStack{
                TextField("Email", text: $email)
                    .padding()
                    .background(Color("Gray"))
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color("Gray"))
                
                Button {
                    fbManager.signIn(email: email, password: password) { isLogin in
                        if isLogin {
                            signInObject.selected = "Каталог"
                            signInObject.greeting = true
                        }
                    }
                } label: {
                    Text("Войти")
                }
            }
        }
        .padding()

    }
    
    struct SignInView_Previews: PreviewProvider {
        static var previews: some View {
            SignInView()
        }
    }
}
