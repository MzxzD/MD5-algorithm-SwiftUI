//
//  ContentView.swift
//  MD5 algorithm SwiftUI
//
//  Created by Mateo Doslic on 02/05/2020.
//  Copyright © 2020 Mateo Doslic. All rights reserved.
//

import SwiftUI
import CoreData
import UIKit

struct ContentView: View {
  @FetchRequest(
    entity: LoginModel.entity(),
    sortDescriptors: [NSSortDescriptor(keyPath: \LoginModel.id, ascending: true)]
  ) var notCompletedTasks: FetchedResults<LoginModel>
  
  
  var body: some View {
    NavigationView {
      List {
        ForEach(notCompletedTasks) { task in
          NavigationLink(destination: UserLoginView(user: task)) {
            UserkRow(loginModel: task)
            
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
