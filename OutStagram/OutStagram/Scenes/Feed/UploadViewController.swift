//
//  UploadViewController.swift
//  OutStagram
//
//  Created by haeseongJung on 2022/03/31.
//

import UIKit
import SnapKit

class UploadViewController: UIViewController {
    
    private let uploadImage: UIImage
    
    private let imageview = UIImageView()
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 15)
        textView.text = "글을 입력해주세요......"
        textView.textColor = .secondaryLabel
        textView.delegate = self
        return textView
    }()
    
    init(uploadImge: UIImage) {
        self.uploadImage = uploadImge
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavigationItem()
        setupLayout()
        
        imageview.image = uploadImage
    }
}

extension UploadViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }
        textView.text = nil
        textView.textColor = .label
    }
}

extension UploadViewController {
    func setupNavigationItem() {
        navigationItem.title = "새 게시물"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(didTapLeftButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "공유", style: .plain, target: self, action: #selector(didTapRightButton))
    }
    
    @objc func didTapLeftButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapRightButton() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupLayout() {
        [imageview, textView].forEach { view.addSubview($0) }
        
        let imageViewInset: CGFloat = 16
        imageview.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(imageViewInset)
            $0.leading.equalToSuperview().inset(imageViewInset)
            $0.width.equalTo(100)
            $0.height.equalTo(imageview.snp.width)
        }
        
        textView.snp.makeConstraints {
            $0.leading.equalTo(imageview.snp.trailing).offset(imageViewInset)
            $0.trailing.equalToSuperview().inset(imageViewInset)
            $0.top.equalTo(imageview.snp.top)
            $0.bottom.equalTo(imageview.snp.bottom)
        }
    }
}
