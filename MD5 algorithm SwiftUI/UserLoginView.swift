//
//  UserLoginView.swift
//  MD5 algorithm SwiftUI
//
//  Created by Mateo Doslic on 03/05/2020.
//  Copyright © 2020 Mateo Doslic. All rights reserved.
//

import SwiftUI

struct UserLoginView: View {
  var user: LoginModel
  @State private var password: String = ""
  @State private var showAlert = false
  @State private var validationEnum : validationEnum!
  
  var body: some View {
    VStack(alignment: .center) {
      UserkRow(loginModel: user)
      SecureField("Enter a password", text: $password)
        .padding(.horizontal, 22.0)
      Button(action: {
        self.validationEnum = FacadeAPI.shared.validatePassword(with: self.password, compareTo: self.user)
        self.showAlert = true
      }, label: { Text("Login")
        
      })   .alert(isPresented: self.$showAlert) {
        switch self.validationEnum {
        case .success:
          return Alert(title: Text("Welcome \(user.name!)"), message: Text("You may join the others"), dismissButton: .default(Text("Okay! :D")))
        case .fail:
          return Alert(title: Text("INTRUDER!"), message: Text("You are not \(user.name!), Get out!"), dismissButton: .default(Text("Okay :(")))        default:
            return Alert(title: Text("Whoops!"), message: Text("Something went Wrong..."), dismissButton: .default(Text("Okay :(")))
        }
      }
      Spacer()
    }
  }
}

struct UserLoginView_Previews: PreviewProvider {
  static var previews: some View {
    UserLoginView(user: FacadeAPI.shared.fetchFirstUser())
  }
}

