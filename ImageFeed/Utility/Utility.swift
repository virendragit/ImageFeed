//
//  Utility.swift
//  ImageFeed
//
//  Created by Virendra Gupta on 22/06/20.
//  Copyright © 2020 sample. All rights reserved.
//

import Foundation
import UIKit
class Utility: NSObject {
    
    static let Shared = Utility()
    //MARK: - Alerts
    func showSimpleAlert(OnViewController vc: UIViewController?, Message message: String) {
        //Create alertController object with specific message
        let alertController = UIAlertController(title: AppConstant.Constant.appDisplayName, message: message, preferredStyle: .alert)
        //Add OK button to alert and dismiss it on action
        let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(alertAction)
        //Show alert to user
        if let VC = vc {
            VC.present(alertController, animated: true, completion: nil)
        }
    }
}
