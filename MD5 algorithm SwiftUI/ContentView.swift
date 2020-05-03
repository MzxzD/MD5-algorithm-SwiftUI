//
//  ContentView.swift
//  MD5 algorithm SwiftUI
//
//  Created by Mateo Doslic on 02/05/2020.
//  Copyright © 2020 Mateo Doslic. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @FetchRequest(
    entity: LoginModel.entity(),
    sortDescriptors: [NSSortDescriptor(keyPath: \LoginModel.id, ascending: true)]
  ) var users: FetchedResults<LoginModel>
  
  var body: some View {
    NavigationView {
      List {
        ForEach(users) { user in
          NavigationLink(destination: UserLoginView(user: user)) {
            UserkRow(loginModel: user)
          }
        }
        .navigationBarTitle("Users")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
