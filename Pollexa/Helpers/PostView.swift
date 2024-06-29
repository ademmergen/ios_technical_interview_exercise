//
//  PostView.swift
//  Pollexa
//
//  Created by Adem Mergen on 24.06.2024.
//

import UIKit

protocol PostViewDelegate: AnyObject {
    func didTapOptionButton(in postView: PostView)
    func didTapOptionButton1(in postView: PostView)
}

class PostView: UIView {
    
    weak var delegate: PostViewDelegate?
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = UIColor(named: "DateLabel")
        return label
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 120/255, green: 120/255, blue: 128/255, alpha: 0.2)
        return view
    }()
    
    private let lastVotedLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor(named: "LastVotedLabel")
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(named: "ContentLabel")
        return label
    }()
    
    private let optionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let optionImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let totalVotesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = UIColor(named: "TotalVotesLabel")
        return label
    }()
    
    private let optionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
        button.tintColor = UIColor(named: "AccentColor")
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        return button
    }()
    
    private let optionButton1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
        button.tintColor = UIColor(named: "AccentColor")
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        return button
    }()
    
    private let percentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        label.text = "50"
        label.isHidden = true
        return label
    }()
    
    private let percentLabel1: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        label.text = "50"
        label.isHidden = true
        return label
    }()
    
    private let percent: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        label.text = "%"
        label.isHidden = true
        return label
    }()
    
    private let percent1: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        label.text = "%"
        label.isHidden = true
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    // MARK: - Setup
    
    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 25
        layer.masksToBounds = true
        
        addSubview(userImageView)
        addSubview(usernameLabel)
        addSubview(dateLabel)
        addSubview(separatorView)
        addSubview(lastVotedLabel)
        addSubview(contentLabel)
        addSubview(optionImageView)
        addSubview(optionImageView1)
        addSubview(totalVotesLabel)
        addSubview(optionButton)
        addSubview(optionButton1)
        addSubview(percentLabel)
        addSubview(percentLabel1)
        addSubview(percent)
        addSubview(percent1)
        
        setupConstraints()
        setupGestures()
    }
    
    // MARK: - Layout
    
    private func setupConstraints() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        lastVotedLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        optionImageView.translatesAutoresizingMaskIntoConstraints = false
        optionImageView1.translatesAutoresizingMaskIntoConstraints = false
        totalVotesLabel.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        optionButton.translatesAutoresizingMaskIntoConstraints = false
        optionButton1.translatesAutoresizingMaskIntoConstraints = false
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        percentLabel1.translatesAutoresizingMaskIntoConstraints = false
        percent.translatesAutoresizingMaskIntoConstraints = false
        percent1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.heightAnchor.constraint(equalToConstant: 338),
            
            userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            userImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 21.2),
            userImageView.widthAnchor.constraint(equalToConstant: 32),
            userImageView.heightAnchor.constraint(equalToConstant: 32),
            
            usernameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 62),
            usernameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            
            dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            
            separatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            separatorView.topAnchor.constraint(equalTo: self.topAnchor, constant: 63.5),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5),
            
            lastVotedLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            lastVotedLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 84),
            
            contentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            contentLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 103),
            
            optionImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            optionImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 159),
            optionImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            optionImageView.widthAnchor.constraint(equalTo: optionImageView1.widthAnchor),
            
            optionImageView1.leadingAnchor.constraint(equalTo: optionImageView.trailingAnchor, constant: 4),
            optionImageView1.topAnchor.constraint(equalTo: self.topAnchor, constant: 159),
            optionImageView1.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            optionImageView1.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            
            totalVotesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            totalVotesLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            
            optionButton.leadingAnchor.constraint(equalTo: optionImageView.leadingAnchor, constant: 10),
            optionButton.bottomAnchor.constraint(equalTo: optionImageView.bottomAnchor, constant: -10),
            optionButton.widthAnchor.constraint(equalToConstant: 30),
            optionButton.heightAnchor.constraint(equalToConstant: 30),
            
            optionButton1.leadingAnchor.constraint(equalTo: optionImageView1.leadingAnchor, constant: 10),
            optionButton1.bottomAnchor.constraint(equalTo: optionImageView1.bottomAnchor, constant: -10),
            optionButton1.widthAnchor.constraint(equalToConstant: 30),
            optionButton1.heightAnchor.constraint(equalToConstant: 30),
            
            percentLabel.trailingAnchor.constraint(equalTo: percent.leadingAnchor, constant: 1),
            percentLabel.bottomAnchor.constraint(equalTo: optionImageView.bottomAnchor, constant: -15),
            
            percentLabel1.trailingAnchor.constraint(equalTo: percent1.leadingAnchor, constant: 1),
            percentLabel1.bottomAnchor.constraint(equalTo: optionImageView1.bottomAnchor, constant: -15),
            
            percent.trailingAnchor.constraint(equalTo: optionImageView.trailingAnchor, constant: -10),
            percent.bottomAnchor.constraint(equalTo: optionImageView.bottomAnchor, constant: -15),
            
            percent1.trailingAnchor.constraint(equalTo: optionImageView1.trailingAnchor, constant: -10),
            percent1.bottomAnchor.constraint(equalTo: optionImageView1.bottomAnchor, constant: -15),
            
        ])
    }
    
    // MARK: - Gestures
    
    private func setupGestures() {
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(optionImageViewTapped))
        optionImageView.addGestureRecognizer(tapGestureRecognizer1)
        
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(optionImageView1Tapped))
        optionImageView1.addGestureRecognizer(tapGestureRecognizer2)
        
        optionButton.addTarget(self, action: #selector(optionImageViewTapped), for: .touchUpInside)
        optionButton1.addTarget(self, action: #selector(optionImageView1Tapped), for: .touchUpInside)
    }
    
    // MARK: - Public Methods
    
    func configure(with post: Post) {
        userImageView.image = post.user.image
        usernameLabel.text = post.user.username
        
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        let timeInterval = Date().timeIntervalSince(post.createdAt)
        dateLabel.text = formatter.localizedString(for: Date(timeIntervalSinceNow: -timeInterval), relativeTo: Date())
        
        lastVotedLabel.text = "LAST VOTED 1 HOUR AGO"
        contentLabel.text = post.content
        
        if post.options.count > 0 {
            optionImageView.image = post.options[0].image
        }
        if post.options.count > 1 {
            optionImageView1.image = post.options[1].image
        }
        
        totalVotesLabel.text = "1 Total Votes"
    }
    
    // MARK: - Actions
    
    @objc private func optionImageViewTapped() {
        
        optionImageView.isUserInteractionEnabled = false
        optionImageView1.isUserInteractionEnabled = false
        
        optionButton.isEnabled = false
        optionButton1.isHidden = true
        percentLabel.isHidden = false
        percentLabel1.isHidden = false
        percent.isHidden = false
        percent1.isHidden = false
        lastVotedLabel.text = "LAST VOTED NOW"
        
        delegate?.didTapOptionButton(in: self)
        totalVotesLabel.text = "2 Total Votes"
        print("Option ImageView Clicked")
    }
    
    @objc private func optionImageView1Tapped() {
        
        optionImageView1.isUserInteractionEnabled = false
        optionImageView.isUserInteractionEnabled = false
        
        optionButton1.isEnabled = false
        optionButton.isHidden = true
        percentLabel.isHidden = false
        percentLabel1.isHidden = false
        percent.isHidden = false
        percent1.isHidden = false
        lastVotedLabel.text = "LAST VOTED NOW"
        
        delegate?.didTapOptionButton1(in: self)
        totalVotesLabel.text = "2 Total Votes"
        print("Option ImageView 1 Clicked")
    }
    
    // MARK: - Layout Overrides
    
    override func layoutSubviews() {
        super.layoutSubviews()
        optionImageView.roundLeftCorners(radius: 10)
        optionImageView1.roundRightCorners(radius: 10)
    }
}

extension UIImageView {
    func roundLeftCorners(radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: [.topLeft, .bottomLeft],
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func roundRightCorners(radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: [.topRight, .bottomRight],
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
