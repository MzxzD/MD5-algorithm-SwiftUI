//
//  UserRow.swift
//  MD5 algorithm SwiftUI
//
//  Created by Mateo Doslic on 03/05/2020.
//  Copyright © 2020 Mateo Doslic. All rights reserved.
//


import SwiftUI
import UIKit

struct UserkRow: View {
  var loginModel: LoginModel
  var body: some View {
    HStack {
      Spacer()
      AsyncImage(
        url: URL(string: loginModel.avatarUrl!)!,
        placeholder: Text("Loading ...")
      ).aspectRatio(contentMode: .fit)
        .frame(width: 100, height: 100)
      Spacer()
        .frame( width: 30 )
      VStack {
        Text(loginModel.name!)
        Spacer()
          .frame( height: 30 )
        Text(loginModel.role!.name!)
      }
      Spacer()
    }
  }
}

struct LandmarkRow_Previews: PreviewProvider {
  static var previews: some View {
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    let loginModelCodables = parseLocalJSON()
    let context = appdelegate.persistentContainer.viewContext
    let loginModelCodable = loginModelCodables!.loginModel.first!
      let loginModel = LoginModel(context: context)
      let role = Role(context: context)
      loginModel.id = Int32(loginModelCodable.id)!
      loginModel.name = loginModelCodable.name
      loginModel.avatarUrl = loginModelCodable.avatarURL
      loginModel.password = loginModelCodable.passHash
      
      // TODO: - Implement a way to check for duplicates
      role.id = FacadeAPI.shared.getNewIdForEntityType(Role.self, in: context)!
      role.name = loginModelCodable.role
      loginModel.role = role
      
      return UserkRow(loginModel: loginModel)
    
  }
}
