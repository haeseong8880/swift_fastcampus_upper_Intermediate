//
//  AppDetailViewController.swift
//  AppStore
//
//  Created by haeseongJung on 2022/03/29.
//

import SnapKit
import UIKit

class AppDetailViewController: UIViewController {
    
    private let today: Today
    
    private var appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()
    
    private var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(sharedButton), for: .touchUpInside)
        return button
    }()
    
    @objc func sharedButton() {
        let shareText: String = "앱 공유!!"
        var shareObject = [Any]()
        shareObject.append(shareText)
        let activityViewController = UIActivityViewController(activityItems : shareObject, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    init(today: Today) {
        self.today = today
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupLayout()
        appIconImageView.backgroundColor = .lightGray
        titleLabel.text = today.title
        subTitleLabel.text = today.subTitle
    }
}

extension AppDetailViewController {
    func setupLayout() {
        [appIconImageView, titleLabel, subTitleLabel, downloadButton, shareButton].forEach{ view.addSubview($0) }
        appIconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(32)
            $0.height.equalTo(100)
            $0.width.equalTo(appIconImageView.snp.height)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(appIconImageView.snp.top)
            $0.leading.equalTo(appIconImageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        downloadButton.snp.makeConstraints {
            $0.bottom.equalTo(appIconImageView.snp.bottom)
            $0.height.equalTo(24)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.width.equalTo(60)
        }
        
        shareButton.snp.makeConstraints {
            $0.bottom.equalTo(appIconImageView.snp.bottom)
            $0.height.equalTo(32.0)
            $0.trailing.equalTo(titleLabel.snp.trailing)
            $0.width.equalTo(32.0)
        }
    }
}
