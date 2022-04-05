//
//  TitleTextFieldCell.swift
//  UsedGoodsUpload
//
//  Created by haeseongJung on 2022/04/05.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class TitleTextFieldCell: UITableViewCell {
    let disposeBag = DisposeBag()
    
    let titleInputField = UITextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        attibute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: TitleTextFieldCellViewModel) {
        titleInputField.rx.text
            .bind(to: viewModel.titleText)
            .disposed(by: disposeBag)
    }
    
    private func attibute() {
        titleInputField.font = .systemFont(ofSize: 17)
    }
    
    private func layout() {
        contentView.addSubview(titleInputField)
        
        titleInputField.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }
    }
}
