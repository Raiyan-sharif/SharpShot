//
//  PhotoFilterPresenter.swift
//  SharpShot
//
//  Created by Raiyan Sharif on 7/1/25.
//

import UIKit

class PhotoFilterPresenter {
    weak var viewModel: PhotoFilterViewModel?

    func presentFilteredImage(response: PhotoFilter.Response) {
        DispatchQueue.main.async {
            if let error = response.error {
                self.viewModel?.error = WrappedError(error: error)
            } else if let image = response.filteredImage {
                self.viewModel?.displayedImage = image
            }
        }
    }
}
