//
//  PhotoFilterViewModel.swift
//  SharpShot
//
//  Created by Raiyan Sharif on 7/1/25.
//

import Combine
import SwiftUI

class PhotoFilterViewModel: ObservableObject {
    @Published var selectedImage: UIImage? = nil {
        didSet {
            // Automatically display the selected image on the UI
            displayedImage = selectedImage
        }
    }
    @Published var displayedImage: UIImage? = nil
    @Published var error: WrappedError? = nil 

    var interactor: PhotoFilterInteractor?

    init() {
        setup()
    }

    private func setup() {
        let interactor = PhotoFilterInteractor()
        let presenter = PhotoFilterPresenter()
        let worker = PhotoFilterWorker()

        self.interactor = interactor
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewModel = self
    }

    func applyFilter() {
        guard let image = selectedImage else { return }
        let request = PhotoFilter.Request(image: image)
        interactor?.applyFilter(request: request)
    }

    func saveImage() {
        guard let image = displayedImage else { return }
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}
