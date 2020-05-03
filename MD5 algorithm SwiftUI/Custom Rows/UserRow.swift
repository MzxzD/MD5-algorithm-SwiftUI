//
//  UserRow.swift
//  MD5 algorithm SwiftUI
//
//  Created by Mateo Doslic on 03/05/2020.
//  Copyright © 2020 Mateo Doslic. All rights reserved.
//

import SwiftUI

struct UserkRow: View {
  var loginModel: LoginModel
  var body: some View {
    HStack {
      Spacer()
      AsyncImage(
        url: URL(string: loginModel.avatarUrl!)!,
        placeholder: ActivityIndicator(isAnimating: .constant(true), style: .medium)
        
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

struct UserkRow_Previews: PreviewProvider {
  static var previews: some View {
    return UserkRow(loginModel: FacadeAPI.shared.fetchFirstUser())
    
  }
}
