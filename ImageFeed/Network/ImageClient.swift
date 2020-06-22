//
//  ImageClient.swift
//  ImageFeed
//
//  Created by Virendra Gupta on 6/21/20.
//  Copyright © 2020 sample. All rights reserved.
//



import UIKit
class ImageClient: NSObject {
    
    static let Shared = ImageClient()
    func fetchImages(completion: @escaping(_ images: [PhotoModel]?, _ error: String) -> ()) {
        //fetch the data
        guard let url = URL(string: AppConstant.Constant.URL) else{ return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                let jsonResponse = try JSONDecoder().decode([PhotoModel].self, from: dataResponse)
                DispatchQueue.main.async {
                    completion(jsonResponse, "success")
                }
            } catch let parsingError {
                print("Error", parsingError)
                DispatchQueue.main.async {
                    completion(nil,parsingError.localizedDescription )
                }
            }
        }
        task.resume()
    }
    
}
