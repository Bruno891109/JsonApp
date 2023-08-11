//
//  WebImageView.swift
//  JsonApp
//
//  Created by MacDev1 on 3/23/23.
//

import Foundation
import SwiftUI

struct WebImageView: View {
    var urlString: URL
    @ObservedObject var imageLoader = ImageLoaderService()
    @State var image: UIImage = UIImage()
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: 90, maxHeight: 90)
            .onReceive(imageLoader.$image) { image in
                self.image = image
            }
            .onAppear{
                imageLoader.loadImage(for: urlString, completion: {})
            }
    }
}
