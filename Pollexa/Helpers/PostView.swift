//
//  PostView.swift
//  Pollexa
//
//  Created by Adem Mergen on 24.06.2024.
//

import Foundation
import UIKit

class PostView: UIView {

    private let userImageView = UIImageView()
    private let usernameLabel = UILabel()
    private let dateLabel = UILabel()
    private let separatorView = UIView()
    private let lastVotedLabel = UILabel()
    private let contentLabel = UILabel()
    private let optionImageView = UIImageView()
    private let optionImageView1 = UIImageView()
    private let totalVotesLabel = UILabel()

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

        // Alt görselleri ekle
        addSubview(userImageView)
        addSubview(usernameLabel)
        addSubview(dateLabel)
        addSubview(separatorView)
        addSubview(lastVotedLabel)
        addSubview(contentLabel)
        addSubview(optionImageView)
        addSubview(optionImageView1)
        addSubview(totalVotesLabel)

        // Kısıtlamaları kur
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

        totalVotesLabel.text = "\(post.options.count) Total Votes"
    }
}

