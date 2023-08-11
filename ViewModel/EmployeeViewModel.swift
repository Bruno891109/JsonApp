//
//  EmployeeViewModel.swift
//  JsonApp
//
//  Created by MacDev1 on 3/23/23.
//

import Foundation
import CoreData

class EmployeeViewModel: ObservableObject {
    private var service: EmployeeService = EmployeeService()
    @Published var employees: [Employee] = Array()
    
    func fetchEmployees(){
        service = EmployeeService()
        #if DEBUG
        if UITestHelper.isUITesting {
            service = EmployeeValidMock()
        }
        #endif
        service.getList(action: "employees") { array in
            self.employees = array;
        }
    }
    
    
}
