//
//  ImageLoader.swift
//  MD5 algorithm SwiftUI
//
//  Created by Mateo Doslic on 03/05/2020.
//  Copyright © 2020 Mateo Doslic. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL

    init(url: URL) {
        self.url = url
    }
  
  private var cancellable: AnyCancellable?
  
  deinit {
      cancellable?.cancel()
  }

  func load() {
      cancellable = URLSession.shared.dataTaskPublisher(for: url)
          .map { UIImage(data: $0.data) }
          .replaceError(with: #imageLiteral(resourceName: "NoImage"))
          .receive(on: DispatchQueue.main)
          .assign(to: \.image, on: self)
  }
  
  func cancel() {
      cancellable?.cancel()
  }
  
}
