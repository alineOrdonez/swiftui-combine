//
//  ImageLoader.swift
//  SwiftUI-Combine
//
//  Created by Aline Ordoñez on 06/05/20.
//  Copyright © 2020 Aline Ordoñez. All rights reserved.
//
import Foundation
import Combine
import UIKit

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    
    private let url: URL
    private var cancellable: AnyCancellable?
    private (set) var isLoading = false
    
    init(url: String) {
        self.url = URL(string: url)!
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func load() {
        guard !isLoading else { return }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .handleEvents(receiveSubscription: { [weak self] _ in self?.onStart() },
                          receiveCompletion: { [weak self] _ in self?.onFinish() },
                          receiveCancel: { [weak self] in self?.onFinish() })
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    func cancel() {
        cancellable?.cancel()
    }
    
    private func onStart() {
        isLoading = true
    }
    
    private func onFinish() {
        isLoading = false
    }
}
