//
//  ExchangeCodeButtonView.swift
//  AppStore
//
//  Created by haeseongJung on 2022/03/29.
//

import SnapKit
import UIKit

class ExchangeCodeButtonView: UIView {
    private var exchangeCodeButton: UIButton = {
        let button = UIButton()
        button.setTitle("코드교환", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .tertiarySystemGroupedBackground
        button.layer.cornerRadius = 7
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ExchangeCodeButtonView {
    func setupLayout() {
        [exchangeCodeButton].forEach { addSubview($0) }
        exchangeCodeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(32)
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(32)
            $0.height.equalTo(40)
        }
    }
}
