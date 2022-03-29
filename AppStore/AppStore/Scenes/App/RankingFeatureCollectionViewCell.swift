//
//  RankingFeatureCollectionViewCell.swift
//  AppStore
//
//  Created by haeseongJung on 2022/03/29.
//

import SnapKit
import UIKit

class RankingFeatureCollectionViewCell: UICollectionViewCell {
    private var imageView: UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = .tertiarySystemGroupedBackground
        imageview.layer.borderColor = UIColor.tertiaryLabel.cgColor
        imageview.layer.borderWidth = 0.5
        imageview.layer.cornerRadius = 7.0
        return imageview
    }()
    
    private var titleLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 2
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        button.backgroundColor = .secondarySystemBackground
        button.layer.cornerRadius = 12
        return button
    }()
    
    private var inAppPurchaseInforLable: UILabel = {
       let label = UILabel()
        label.text = "앱 내 구입"
        label.font = .systemFont(ofSize: 10, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    func setup(rankingFeature: RankingFeature) {
        setupLayout()
        
        titleLable.text = rankingFeature.title
        descriptionLabel.text = rankingFeature.description
        inAppPurchaseInforLable.isHidden = rankingFeature.isInPurchaseApp
    }
}

extension RankingFeatureCollectionViewCell {
    func setupLayout() {
        [imageView, titleLable, descriptionLabel, downloadButton, inAppPurchaseInforLable].forEach { addSubview($0) }
        
        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview().inset(4)
            $0.bottom.equalToSuperview().inset(4)
            $0.width.equalTo(imageView.snp.height)
        }
        
        downloadButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(24)
            $0.width.equalTo(50)
        }
        
        inAppPurchaseInforLable.snp.makeConstraints {
            $0.centerX.equalTo(downloadButton.snp.centerX)
            $0.top.equalTo(downloadButton.snp.bottom).offset(4)
        }
        
        titleLable.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(8)
            $0.trailing.equalTo(downloadButton.snp.leading)
            $0.top.equalTo(imageView.snp.top).inset(8)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLable.snp.leading)
            $0.trailing.equalTo(titleLable.snp.trailing)
            $0.top.equalTo(titleLable.snp.bottom).offset(4)
        }
    }
}
