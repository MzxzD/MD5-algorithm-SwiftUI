//
//  Role+CoreDataProperties.swift
//  MD5 algorithm SwiftUI
//
//  Created by Mateo Doslic on 02/05/2020.
//  Copyright © 2020 Mateo Doslic. All rights reserved.
//
//

import Foundation
import CoreData


extension Role {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Role> {
        return NSFetchRequest<Role>(entityName: "Role")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var loginModel: LoginModel?

}
