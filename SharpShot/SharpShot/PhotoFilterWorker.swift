//
//  PhotoFilterWorker.swift
//  SharpShot
//
//  Created by Raiyan Sharif on 7/1/25.
//

import UIKit
import CoreImage
import CoreImage.CIFilterBuiltins

class PhotoFilterWorker {
    func applySharpnessFilter(image: UIImage, completion: @escaping (UIImage?, Error?) -> Void) {
        let context = CIContext()
        let filter = CIFilter.sharpenLuminance() // CoreImage sharpening filter
        filter.sharpness = 0.8 // Set sharpness value

        guard let ciImage = CIImage(image: image) else {
            completion(nil, NSError(domain: "PhotoFilterWorker", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unable to create CIImage"]))
            return
        }

        filter.inputImage = ciImage

        guard let outputImage = filter.outputImage,
              let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {
            completion(nil, NSError(domain: "PhotoFilterWorker", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unable to generate output image"]))
            return
        }

        completion(UIImage(cgImage: cgImage), nil)
    }
}
