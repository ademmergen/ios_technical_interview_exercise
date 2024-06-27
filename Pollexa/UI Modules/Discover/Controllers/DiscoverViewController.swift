//
//  DiscoverViewController.swift
//  Pollexa
//
//  Created by Emirhan Erdogan on 13/05/2024.
//

import UIKit

class DiscoverViewController: UIViewController, PostViewDelegate {
    
    // MARK: - Properties
    private let postProvider = PostProvider.shared
    private var posts: [Post] = []
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    private let activePollsLabel = UILabel()
    private var remainingPollsCount: Int = 0
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "ViewBackground")
        
        setupNavigationBar()
        setupHeaderView()
        setupScrollView()
        setupStackView()
        fetchPosts()
    }
    
    // MARK: - PostViewDelegate
    func didTapOptionButton(in postView: PostView) {
        decrementPollsCount()
    }
    
    func didTapOptionButton1(in postView: PostView) {
        decrementPollsCount()
    }
    
    // MARK: - Setup Methods
    private func fetchPosts() {
        postProvider.fetchAll { result in
            switch result {
            case .success(let posts):
                self.posts = posts
                self.remainingPollsCount = posts.count
                self.activePollsLabel.text = "\(posts.count) Active Polls"
                self.setupPostViews()
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
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
        imageView.image = UIImage(named: "avatar_1")
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
    
    private func setupHeaderView() {
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        activePollsLabel.translatesAutoresizingMaskIntoConstraints = false
        activePollsLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        activePollsLabel.textColor = .white
        
        let seeDetailsLabel = UILabel()
        seeDetailsLabel.translatesAutoresizingMaskIntoConstraints = false
        seeDetailsLabel.text = "See Details"
        seeDetailsLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        seeDetailsLabel.alpha = 0.5
        seeDetailsLabel.textColor = .white
        
        let arrowImageView = UIImageView()
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.image = UIImage(systemName: "arrow.right.square.fill")
        arrowImageView.tintColor = .white
        
        headerView.addSubview(activePollsLabel)
        headerView.addSubview(seeDetailsLabel)
        headerView.addSubview(arrowImageView)
        
        view.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            headerView.heightAnchor.constraint(equalToConstant: 78),
            
            activePollsLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            activePollsLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 15),
            activePollsLabel.heightAnchor.constraint(equalToConstant: 25),
            
            seeDetailsLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            seeDetailsLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 42),
            seeDetailsLabel.heightAnchor.constraint(equalToConstant: 21),
            
            arrowImageView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -21),
            arrowImageView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 22),
            arrowImageView.heightAnchor.constraint(equalToConstant: 33),
            arrowImageView.widthAnchor.constraint(equalToConstant: 33)
        ])
        
        headerView.backgroundColor = UIColor(named: "AccentColor")
        headerView.layer.cornerRadius = 16
    }
    
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 268),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupPostViews() {
        for post in posts {
            let postView = PostView()
            postView.translatesAutoresizingMaskIntoConstraints = false
            postView.configure(with: post)
            stackView.addArrangedSubview(postView)
            postView.delegate = self
        }
    }
    
    // MARK: - Helper Methods
    private func decrementPollsCount() {
        remainingPollsCount -= 1
        activePollsLabel.text = "\(remainingPollsCount) Active Polls"
    }
}
