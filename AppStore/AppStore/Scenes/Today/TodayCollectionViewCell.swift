//
//  TodayCollectionViewCell.swift
//  AppStore
//
//  Created by haeseongJung on 2022/03/28.
//

import SnapKit
import UIKit
import Kingfisher

class TodayCollectionViewCell: UICollectionViewCell {
    
    private var titleLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private var subTitleLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private var descriptionLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private var imageView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 12.0
        image.backgroundColor = .gray
        return image
    }()
    
    func setup(today: Today) {
        setupSubView()
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 10
        
        subTitleLabel.text = today.subTitle
        descriptionLabel.text = today.description
        titleLabel.text = today.title
        
        if let imageURL = URL(string: today.imageURL) {
            imageView.kf.setImage(with: imageURL)
        }
    }
}

private extension TodayCollectionViewCell {
    func setupSubView() {
        [imageView, titleLabel, subTitleLabel, descriptionLabel].forEach { addSubview($0) }
        
        subTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(24)
            $0.top.equalToSuperview().inset(24)
        }
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(subTitleLabel)
            $0.trailing.equalTo(subTitleLabel)
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(24)
        }
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().inset(24)
        }
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
