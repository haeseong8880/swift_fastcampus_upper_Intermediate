//
//  FeedViewCell.swift
//  OutStagram
//
//  Created by haeseongJung on 2022/03/31.
//

import SnapKit
import UIKit

class FeedViewCell: UITableViewCell {
    
    private var postImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .tertiaryLabel
        return image
    }()
    
    private var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "heart")
        
        return button
    }()
    
    private var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "message")
        return button
    }()
    
    private var directMessageButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "paperplane")
        return button
    }()
    
    private var bookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "bookmark")
        return button
    }()
    
    private var currentLikedCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.text = "가가멜님 외 31명이 좋아합니다."
        return label
    }()
    
    private var contentsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.numberOfLines = 5
        label.text = "이 게시물은 영국에서 시작되어, 글을 본 10일 이내에 100곳에 글을 옮기지 않으면, 별스타그램 세상에서 행복할 수 없을지도 모른다. 이 게시물의 내용을 무시하고, 옮기지않은 김아무개는 그 이후로 좋아요를 받지 못했으며 결국 팔로워도 0이 되었다."
        return label
    }()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 11, weight: .medium)
        label.text = "1일 전"
        return label
    }()
    
    func setup() {
        [postImageView, likeButton, commentButton, directMessageButton, bookmarkButton, currentLikedCountLabel, contentsLabel, contentsLabel, dateLabel].forEach {
            addSubview($0)
        }
        
        postImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(postImageView.snp.width)
        }

        let buttonWidth: CGFloat = 24.0
        let buttonInset: CGFloat = 16.0

        likeButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(postImageView.snp.bottom).offset(buttonInset)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }

        let buttonSpacing: CGFloat = 12.0

        commentButton.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.trailing).offset(buttonSpacing)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }

        directMessageButton.snp.makeConstraints {
            $0.leading.equalTo(commentButton.snp.trailing).offset(buttonSpacing)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }

        bookmarkButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }

        currentLikedCountLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(likeButton.snp.bottom).offset(14.0)
        }

        let labelVerticalSpacing: CGFloat = 8.0

        contentsLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(currentLikedCountLabel.snp.bottom).offset(labelVerticalSpacing)
        }

        dateLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(contentsLabel.snp.bottom).offset(labelVerticalSpacing)
            $0.bottom.equalToSuperview().inset(16.0)
        }
        
    }
}
