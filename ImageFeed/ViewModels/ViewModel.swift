//
//  ViewModel.swift
//  ImageFeed
//
//  Created by Virendra Gupta on 6/21/20.
//  Copyright © 2020 sample. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    var images: [PhotoModel]?
    
    func fetchImages( vc: UIViewController?, completion:@escaping(_ error: String) -> ()) {
        ImageClient.Shared.fetchImages { (images,error)  in
            if error == "success" {
                self.images = images
                completion(error)
            } else {
                guard let VC = vc else { return }
                Utility.Shared.showSimpleAlert(OnViewController: VC, Message: error)
            }
            
        }
          
    }
    
    func numberOfItemInSection(section: Int) -> Int{
        return self.images?.count ?? 0
    }
    func cellSize(index: Int) -> CGSize {
        guard let images = self.images else { return CGSize() }
        return CGSize(width: images[index].width, height: images[index].height)
    }
    
    func titleForItemAtIndexPath(index: Int) -> [PhotoModel]{
        guard let images = self.images else { return [] }
            return [images[index]]
        }
    

}
