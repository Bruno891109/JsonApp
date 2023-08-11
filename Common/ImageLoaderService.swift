//
//  ImageLoaderService.swift
//  JsonApp
//
//  Created by MacDev1 on 3/23/23.
//

import Foundation
import UIKit
import CryptoKit

class ImageLoaderService: ObservableObject {
    @Published var image: UIImage = UIImage()
    
    func loadImage(for urlString: URL, completion: @escaping () -> ()) {
        
        let fileName = "\(SHA256.hash(data: Data(urlString.absoluteString.utf8)).compactMap({String(format: "%02x", $0)}).joined()).jpg"
        let catchFilePath = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        
        let fileManager = FileManager.default
        let fileExist = fileManager.fileExists(atPath: catchFilePath.path)
        if fileExist == true{
            DispatchQueue.main.async {
                if let fileImage = UIImage(contentsOfFile: catchFilePath.path){
                    self.image = fileImage
                }
            }
            completion()
            return
        }else{
            let task = URLSession.shared.dataTask(with: urlString) { data, response, error in
                guard let data = data else {
                    completion()
                    return
                }
                do{
                    try data.write(to: catchFilePath)
                } catch{
                    print(catchFilePath)
                    print(error.localizedDescription)
                }
                DispatchQueue.main.async {
                    self.image = UIImage(data: data) ?? UIImage()
                }
                completion()
            }
            task.resume()
        }
    }
}
