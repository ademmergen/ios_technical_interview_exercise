//
//  DiscoverViewController.swift
//  Pollexa
//
//  Created by Emirhan Erdogan on 13/05/2024.
//

import UIKit

class DiscoverViewController: UIViewController {
    
    // MARK: - Properties
    private let postProvider = PostProvider.shared
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        postProvider.fetchAll { result in
            switch result {
            case .success(let posts):
                print(posts)
                
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Setup Methods
    private func setupNavigationBar() {
        let navigationBar = UIView()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(navigationBar)
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 54),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2),
            navigationBar.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        let addButton = UIButton(type: .system)
        let addImage = UIImage(systemName: "plus")
        addButton.setImage(addImage, for: .normal)
        addButton.tintColor = UIColor(named: "AccentColor")
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        navigationBar.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: navigationBar.topAnchor, constant: 11),
            addButton.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -11),
            addButton.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: -16)
        ])
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "avatar_1") // Görüntüyü ayarlayın
        imageView.layer.cornerRadius = 17
        imageView.clipsToBounds = true
        
        navigationBar.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 18),
            imageView.topAnchor.constraint(equalTo: navigationBar.topAnchor, constant: 5.85),
            imageView.widthAnchor.constraint(equalToConstant: 34),
            imageView.heightAnchor.constraint(equalToConstant: 34)
        ])
        
        let discoverNavigationBar = UIView()
        discoverNavigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(discoverNavigationBar)
        
        NSLayoutConstraint.activate([
            discoverNavigationBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 98),
            discoverNavigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2),
            discoverNavigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2),
            
        ])
        
        let discoverLabel = UILabel()
        discoverLabel.translatesAutoresizingMaskIntoConstraints = false
        discoverLabel.text = "Discover"
        discoverLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        discoverNavigationBar.addSubview(discoverLabel)
        
        NSLayoutConstraint.activate([
            discoverLabel.leadingAnchor.constraint(equalTo: discoverNavigationBar.leadingAnchor, constant: 16),
            discoverLabel.topAnchor.constraint(equalTo: discoverNavigationBar.topAnchor, constant: 3),
            discoverLabel.heightAnchor.constraint(equalToConstant: 41)
        ])
    }
}


