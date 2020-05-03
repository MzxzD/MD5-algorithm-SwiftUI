//
//  CoreDataAPI.swift
//  MD5 algoritm
//
//  Created by Mateo Doslic on 22/04/2020.
//  Copyright © 2020 Mateo Doslic. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataAPI {
  
  func getNewIdForEntityType<T: NSManagedObject>(_ type: T.Type, in managedContext: NSManagedObjectContext) -> Int32? {
    let fetchRequest = T.fetchRequest()
    fetchRequest.fetchLimit = 1
    fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
    
    do {
      let results = try managedContext.fetch(fetchRequest)
      if let id = (results.first as? T)?.value(forKey: "id") as? Int32 {
        if (id > 0) {
          return id + 1
        } else {
          return 1
        }
      } else {
        return 1
      }
    } catch let error as NSError {
      print("Could not fetch \(error.localizedDescription)")
    }
    return nil
  }
  
  func fetchFirstUser() -> LoginModel {
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
      
      return loginModel
  }
  
}
