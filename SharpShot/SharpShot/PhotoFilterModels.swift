//
//  PhotoFilterModels.swift
//  SharpShot
//
//  Created by Raiyan Sharif on 7/1/25.
//

import UIKit

enum PhotoFilter {
    struct Request {
        let image: UIImage
    }

    struct Response {
        let filteredImage: UIImage?
        let error: Error?
    }

    struct ViewModel {
        let image: UIImage?
        let errorMessage: String?
    }
}
