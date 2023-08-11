//
//  Employee+CoreDataClass.swift
//  JsonApp
//
//  Created by MacDev1 on 3/23/23.
//
//

import Foundation
import CoreData

extension CodingUserInfoKey {
    static let context = CodingUserInfoKey(rawValue: "context")
}
@objc(Employee)
public class Employee: NSManagedObject, Codable {
    
    enum EmployeeType: String, Codable{
        case FULL_TIME
        case PART_TIME
        case CONTRACTOR
        
        func description() -> String {
            switch self{
            case .FULL_TIME:
                return "Full Time Contract"
            case .PART_TIME:
                return "Part Time Contract"
            case .CONTRACTOR:
                return "W2 Contract"
            }
        }
    }
    enum CodingKeys: String, CodingKey {
        case uuid, full_name, phone_number, email_address, biography
        case smallPhoto = "photo_url_small"
        case largePhoto = "photo_url_large"
        case team, employee_type
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do{
            try container.encode(uuid ?? UUID(), forKey: .uuid)
            try container.encode(full_name ?? "", forKey: .full_name)
            try container.encode(phone_number ?? "", forKey: .phone_number)
            try container.encode(email_address ?? "", forKey: .email_address)
            try container.encode(biography ?? "", forKey: .biography)
            try container.encode(smallPhoto ?? URL(string: ""), forKey: .smallPhoto) 
            try container.encode(largePhoto ?? URL(string: ""), forKey: .largePhoto)
            try container.encode(team ?? "", forKey: .team)
            try container.encode(employee_type ?? "", forKey: .employee_type)
        }catch{}
    }
    required convenience public init(from decoder: Decoder) throws {
        guard let contextUserInforKey = CodingUserInfoKey.context else{
            fatalError("Fail to decode Employee")
        }
        guard let manageObjectContext = decoder.userInfo[contextUserInforKey] as? NSManagedObjectContext else{
            fatalError("Fail to decode Employee")
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "Employee", in: manageObjectContext) else{
            fatalError("Fail to decode Employee")
        }
        self.init(entity: entity, insertInto: manageObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try values.decode(UUID.self, forKey: .uuid)
        full_name = try values.decode(String?.self, forKey: .full_name)
        phone_number = try values.decode(String?.self, forKey: .phone_number)
        email_address = try values.decode(String?.self, forKey: .email_address)
        biography = try values.decode(String?.self, forKey: .biography)
        smallPhoto = try values.decode(URL?.self, forKey: .smallPhoto)
        largePhoto = try values.decode(URL?.self, forKey: .largePhoto)
        team = try values.decode(String?.self, forKey: .team)
        employee_type = try values.decode(String?.self, forKey: .employee_type)
        
    }
}
