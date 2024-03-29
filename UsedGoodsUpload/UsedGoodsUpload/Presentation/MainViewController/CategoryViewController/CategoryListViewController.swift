//
//  CategoryListViewController.swift
//  UsedGoodsUpload
//
//  Created by haeseongJung on 2022/04/05.
//

import UIKit
import RxSwift
import RxCocoa

class CategoryListViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let tableView = UITableView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        attibute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: CategoryViewModel) {
        viewModel.cellData
            .drive(tableView.rx.items) { tv, row, data in
                let cell = tv.dequeueReusableCell(withIdentifier: "CategoryListCell", for: IndexPath(row: row, section: 0))
                cell.textLabel?.text = data.name
                return cell
            }
            .disposed(by: disposeBag)
        
        viewModel.pop
            .emit(onNext: { [weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .map { $0.row }
            .bind(to: viewModel.itemSelected)
            .disposed(by: disposeBag)
        
    }
    
    private func attibute() {
        view.backgroundColor = .systemBackground
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategoryListCell")
        tableView.tableFooterView = UIView()
    }
    
    private func layout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}
