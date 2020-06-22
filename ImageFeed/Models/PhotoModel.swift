//
//  PhotoModel.swift
//  ImageFeed
//
//  Created by Virendra Gupta on 22/06/20.
//  Copyright © 2020 sample. All rights reserved.
//

import Foundation
struct PhotoModel: Decodable {
    let format: String
    let width: Int
    let height: Int
    let filename: String
    let id: Int
    let author: String
    let author_url: String
    let post_url: String
}

