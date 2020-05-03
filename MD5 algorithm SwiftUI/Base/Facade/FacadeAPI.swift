//
//  FacadeAPI.swift
//  MD5 algoritm
//
//  Created by Mateo Doslic on 21/04/2020.
//  Copyright © 2020 Mateo Doslic. All rights reserved.
//

import Foundation
import CoreData
import UIKit

enum validationEnum {
  case success
  case error
  case fail
}

class FacadeAPI {
  private var serializationManager: SerializationManager
  private var coreDataApi: CoreDataAPI
  

  static let shared = FacadeAPI()
  
  private init() {
    serializationManager = SerializationManager()
    coreDataApi = CoreDataAPI()
  }
  
  func getNewIdForEntityType<T: NSManagedObject>(_ type: T.Type, in managedContext: NSManagedObjectContext) -> Int32? {
    return coreDataApi.getNewIdForEntityType(type.self, in: managedContext)
  }
  
  
  func validatePassword(with input: String, compareTo user: LoginModel) -> validationEnum {
    if let passwordHased = input.hashed(.md5)?.uppercased() {
      if passwordHased == user.password {
        return .success
      } else {
        return .fail
      }
    } else {
      return .error
    }
  }

  func fetchFirstUser() -> LoginModel {
   return coreDataApi.fetchFirstUser()
  }
  
}

