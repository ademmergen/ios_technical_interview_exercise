//
//  PostView.swift
//  Pollexa
//
//  Created by Adem Mergen on 24.06.2024.
//

protocol PostViewDelegate: AnyObject {
    func didTapOptionButton(in postView: PostView)
    func didTapOptionButton1(in postView: PostView)
}

import Foundation
import UIKit

class PostView: UIView {
    
    weak var delegate: PostViewDelegate?
    
    private let userImageView = UIImageView()
    private let usernameLabel = UILabel()
    private let dateLabel = UILabel()
    private let separatorView = UIView()
    private let lastVotedLabel = UILabel()
    private let contentLabel = UILabel()
    private let optionImageView = UIImageView()
    private let optionImageView1 = UIImageView()
    private let totalVotesLabel = UILabel()
    
    private let optionButton = UIButton()
    private let optionButton1 = UIButton()
    
    private let percentLabel = UILabel()
    private let percentLabel1 = UILabel()
    
    private let percent = UILabel()
    private let percent1 = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 25
        self.layer.masksToBounds = true
        
        userImageView.layer.cornerRadius = 16
        userImageView.clipsToBounds = true
        
        usernameLabel.font = .systemFont(ofSize: 17)
        
        dateLabel.font = .systemFont(ofSize: 15)
        dateLabel.textColor = UIColor(named: "DateLabel")
        
        let separatorColor = UIColor(red: 120/255, green: 120/255, blue: 128/255, alpha: 0.2)
        separatorView.backgroundColor = separatorColor
        
        lastVotedLabel.font = .systemFont(ofSize: 12, weight: .medium)
        lastVotedLabel.textColor = UIColor(named: "LastVotedLabel")
        
        contentLabel.font = .systemFont(ofSize: 17, weight: .medium)
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = .byWordWrapping
        contentLabel.textColor = UIColor(named: "ContentLabel")
        
        totalVotesLabel.font = .systemFont(ofSize: 13)
        totalVotesLabel.textColor = UIColor(named: "TotalVotesLabel")
        
        optionImageView.isUserInteractionEnabled = true
        optionImageView1.isUserInteractionEnabled = true
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(optionImageViewTapped))
        optionImageView.addGestureRecognizer(tapGestureRecognizer1)
        
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(optionImageView1Tapped))
        optionImageView1.addGestureRecognizer(tapGestureRecognizer2)
    
        optionButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
        optionButton.tintColor = UIColor(named: "AccentColor")
        optionButton.backgroundColor = .white
        optionButton.layer.cornerRadius = 15
        optionButton.clipsToBounds = true
        optionButton.addTarget(self, action: #selector(optionImageViewTapped), for: .touchUpInside)
        
        optionButton1.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
        optionButton1.tintColor = UIColor(named: "AccentColor")
        optionButton1.backgroundColor = .white
        optionButton1.layer.cornerRadius = 15
        optionButton1.clipsToBounds = true
        optionButton1.addTarget(self, action: #selector(optionImageView1Tapped), for: .touchUpInside)
        
        percentLabel.font = .systemFont(ofSize: 15, weight: .bold)
        percentLabel.textColor = .white
        percentLabel.text = "50"
        
        percentLabel1.font = .systemFont(ofSize: 15, weight: .bold)
        percentLabel1.textColor = .white
        percentLabel1.text = "50"
        
        percent.font = .systemFont(ofSize: 15, weight: .bold)
        percent.textColor = .white
        percent.text = "%"
        
        percent1.font = .systemFont(ofSize: 15, weight: .bold)
        percent1.textColor = .white
        percent1.text = "%"
        
        percentLabel.isHidden = true
        percentLabel1.isHidden = true
        percent.isHidden = true
        percent1.isHidden = true
        
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
    }
    
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
    
    func configure(with post: Post) {
        userImageView.image = post.user.image
        usernameLabel.text = post.user.username
        dateLabel.text = DateFormatter.localizedString(from: post.createdAt, dateStyle: .short, timeStyle: .none)
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
    
    @objc private func optionImageViewTapped() {
        
        optionImageView.isUserInteractionEnabled = false
        optionImageView1.isUserInteractionEnabled = false
        
        optionButton.isEnabled = false
        optionButton1.isHidden = true
        percentLabel.isHidden = false
        percentLabel1.isHidden = false
        percent.isHidden = false
        percent1.isHidden = false
        
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
        
        delegate?.didTapOptionButton1(in: self)
        totalVotesLabel.text = "2 Total Votes"
        print("Option ImageView 1 Clicked")
    }
    
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
