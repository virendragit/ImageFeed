//
//  ViewController.swift
//  ImageFeed
//
//  Created by Virendra Gupta on 6/21/20.
//  Copyright © 2020 sample. All rights reserved.
//

import UIKit
import SDWebImage
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var viewModel: ViewModel!
    @IBOutlet weak var imageListTableView: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.showActivity(isHidden: false)
            viewModel.fetchImages(vc: self) {[weak self] error in
            if error == "success" {
                
                DispatchQueue.main.async {
                    self?.showActivity(isHidden: true)
                    self?.reloadData()
                }
                
            }
        }
    }
    
    private func showActivity(isHidden: Bool) {
        activity.isHidden = isHidden
        if isHidden {
            activity.stopAnimating()
        }else {
            activity.startAnimating()
        }
        
    }
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageListTableView.estimatedRowHeight = 250 // match your tallest cell
        imageListTableView.rowHeight = UITableView.automaticDimension
        
        
    }
    private func reloadData() {
        imageListTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: AppConstant.Constant.photoCellIdentifier) as? PhotoCell else { return UITableViewCell()}
         let imageList = viewModel.titleForItemAtIndexPath(index: indexPath.row)
            tableViewCell.imageTitle.text = imageList[0].author
        tableViewCell.imagePreview.sd_setImage(with: URL(string: AppConstant.Constant.imageUrl + "\(imageList[0].id)")) { (image, error, type, url) in
            DispatchQueue.main.async {
                tableViewCell.imagePreview.image = image
            }
            
        }
        return tableViewCell
    }
    
    
    
    
 
    
    
    
    
}

