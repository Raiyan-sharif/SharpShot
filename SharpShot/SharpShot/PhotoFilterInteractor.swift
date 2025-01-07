//
//  PhotoFilterInteractor.swift
//  SharpShot
//
//  Created by Raiyan Sharif on 7/1/25.
//

import UIKit

class PhotoFilterInteractor {
    var presenter: PhotoFilterPresenter?
    var worker: PhotoFilterWorker?

    func applyFilter(request: PhotoFilter.Request) {
        guard let worker = worker else { return }

        worker.applySharpnessFilter(image: request.image) { filteredImage, error in
            let response = PhotoFilter.Response(filteredImage: filteredImage, error: error)
            self.presenter?.presentFilteredImage(response: response)
        }
    }
}
