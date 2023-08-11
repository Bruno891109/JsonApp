//
//  EmployeeService.swift
//  JsonApp
//
//  Created by MacDev1 on 3/23/23.
//

import Foundation
import CoreData

class EmployeeService {
    let SERVER_URL = "https://s3.amazonaws.com"
    let PLAYGROUND = "sq-mobile-interview"
    
    private func serverRequestPoint(actionName action: String) -> URL {
        return URL(string: "\(SERVER_URL)/\(PLAYGROUND)/\(action).json")!
    }
    func getList(action: String, completion: @escaping ([Employee]) -> ()){
        let url = serverRequestPoint(actionName: action)
        NSLog(url.absoluteString)
        let request = APIRequest()
        request.perform(from: url){(items: [String: [Employee]]?) -> Void in
            let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
            guard let items = items, let employeeArray = items["employees"] else{
                let fetchRequest : NSFetchRequest<Employee> = Employee.fetchRequest()
                do {
                    let objects = try context.fetch(fetchRequest)
                    completion(objects)
                }catch {
                    print(error.localizedDescription)
                }
                return
            }
            DispatchQueue.main.async {
                completion(employeeArray)
            }
            do {
                try context.save()
            }catch {
                print(error.localizedDescription)
            }
        }
    }
}
