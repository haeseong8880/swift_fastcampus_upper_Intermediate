//
//  ProfileCollectionViewCell.swift
//  OutStagram
//
//  Created by haeseongJung on 2022/03/31.
//

import SnapKit
import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()
    
    func setup(with image: UIImage) {
        addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        imageView.backgroundColor = .tertiaryLabel
    }
}
