//
//  AsyncImage.swift
//  MD5 algorithm SwiftUI
//
//  Created by Mateo Doslic on 03/05/2020.
//  Copyright © 2020 Mateo Doslic. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

struct AsyncImage<Placeholder: View>: View {
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Placeholder?
    
    init(url: URL, placeholder: Placeholder? = nil) {
        loader = ImageLoader(url: url)
        self.placeholder = placeholder
    }

    var body: some View {
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
  
  private var image: some View {
       Group {
           if loader.image != nil {
               Image(uiImage: loader.image!)
                   .resizable()
           } else {
               placeholder
           }
       }
   }
  
}
