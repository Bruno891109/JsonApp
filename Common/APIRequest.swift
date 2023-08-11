//
//  APIRequest.swift
//  JsonApp
//
//  Created by MacDev1 on 3/23/23.
//

import Foundation
import CoreData

class APIRequest{
    private let session: URLSession
    
    init(session: URLSession = .shared){
        self.session = session
    }
    func perform<T:Decodable>(from url: URL, with completion: @escaping(T?) -> Void) {
        session.loadData(from: url) { data, error in
            guard let data = data else {
                completion(nil)
                return
            }
            let jsonMapper = JsonMapper()
            let context = CoreDataStack.sharedInstance.persistentContainer.viewContext;
            jsonMapper.parse(data: data, context: context) { result in
                completion(result)
            }
        }
    }
}
class JsonMapper{
    func parse<T:Decodable>(data: Data, context: AnyObject?, completion:@escaping(T?) -> Void) {
        let decoder = JSONDecoder()
        if let context = context {
            decoder.userInfo[CodingUserInfoKey.context!] = context
        }
        decoder.dateDecodingStrategy = .secondsSince1970
        completion(try? decoder.decode(T.self, from: data))
    }
}
