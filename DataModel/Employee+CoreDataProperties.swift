//
//  Employee+CoreDataProperties.swift
//  JsonApp
//
//  Created by MacDev1 on 3/23/23.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var uuid: UUID?
    @NSManaged public var full_name: String?
    @NSManaged public var phone_number: String?
    @NSManaged public var email_address: String?
    @NSManaged public var biography: String?
    @NSManaged public var smallPhoto: URL?
    @NSManaged public var largePhoto: URL?
    @NSManaged public var team: String?
    @NSManaged public var employee_type: String?

}

extension Employee : Identifiable {

}
