//
//  LoginModel+CoreDataProperties.swift
//  MD5 algorithm SwiftUI
//
//  Created by Mateo Doslic on 02/05/2020.
//  Copyright © 2020 Mateo Doslic. All rights reserved.
//
//

import Foundation
import CoreData


extension LoginModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LoginModel> {
        return NSFetchRequest<LoginModel>(entityName: "LoginModel")
    }

    @NSManaged public var avatarUrl: String?
    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var role: Role?

}
