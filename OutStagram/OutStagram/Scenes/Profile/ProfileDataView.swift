//
//  ProfileDataView.swift
//  OutStagram
//
//  Created by haeseongJung on 2022/03/31.
//

import SnapKit
import UIKit

class ProfileDataView: UIView {
    
    private let title: String
    private let count: Int
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.text = title
        return label
    }()
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "\(count)"
        return label
    }()
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupLayout()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    init(title: String, count: Int) {
        self.title = title
        self.count = count
        
        super.init(frame: .zero)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension ProfileDataView {
    func setupLayout() {
        let stack = UIStackView(arrangedSubviews: [ countLabel, titleLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 4
        
        addSubview(stack)
        
        stack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
