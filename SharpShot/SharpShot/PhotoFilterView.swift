//
//  PhotoFilterView.swift
//  SharpShot
//
//  Created by Raiyan Sharif on 7/1/25.
//

import SwiftUI
import PhotosUI

struct PhotoFilterView: View {
    @StateObject private var viewModel = PhotoFilterViewModel()
    @State private var showPhotoPicker = false

    var body: some View {
        VStack {
            Text("Photo Filter App")
                .font(.largeTitle)
                .bold()
                .padding()

            ZStack {
                if let image = viewModel.displayedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .cornerRadius(12)
                        .shadow(radius: 8)
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 250, height: 250)
                        .cornerRadius(12)
                        .overlay(
                            Text("Select an Image")
                                .foregroundColor(.gray)
                        )
                        .onTapGesture { showPhotoPicker = true }
                }
            }
            .padding()

            // Buttons for filter and save actions
            HStack {
                Button(action: {
                    viewModel.applyFilter()
                }) {
                    Text("Apply Filter")
                }
                .disabled(viewModel.displayedImage == nil)
                .padding()
                .background(viewModel.displayedImage == nil ? Color.gray : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)

                Button(action: {
                    viewModel.saveImage()
                }) {
                    Text("Save Image")
                }
                .disabled(viewModel.displayedImage == nil)
                .padding()
                .background(viewModel.displayedImage == nil ? Color.gray : Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
        }
        .sheet(isPresented: $showPhotoPicker) {
            PhotoPicker(selectedImage: $viewModel.selectedImage)
        }
        .alert(item: $viewModel.error) { wrappedError in
            Alert(title: Text("Error"), message: Text(wrappedError.error.localizedDescription), dismissButton: .default(Text("OK")))
        }
    }
}
