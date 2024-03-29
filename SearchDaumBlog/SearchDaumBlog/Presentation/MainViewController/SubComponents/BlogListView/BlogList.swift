//
//  BlogList.swift
//  SearchDaumBlog
//
//  Created by haeseongJung on 2022/04/04.
//

import RxSwift
import RxCocoa
import UIKit

class BlogListView: UITableView {
    let disposeBag = DisposeBag()
    
    let headerView = FilterView(frame:CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: 50)))
    
    let cellData = PublishSubject<[BlogListCellData]>()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        bind()
        attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        cellData
            .asDriver(onErrorJustReturn: [])
            .drive(self.rx.items) { tableview, row, data in
                let indexPath = IndexPath(row: row, section: 0)
//                let cell = tableview.dequeueReusableCell(withIdentifier: "BlogListCell", for: indexPath) as! BlogListCell
                guard let cell = tableview.dequeueReusableCell(withIdentifier: "BlogListCell", for: indexPath) as? BlogListCell else { return UITableViewCell() }
                cell.setData(data)
                return cell
            }
            .disposed(by: disposeBag)
    }
    
    private func attribute() {
        self.backgroundColor = .white
        self.register(BlogListCell.self, forCellReuseIdentifier: "BlogListCell")
        self.separatorStyle = .singleLine
        self.rowHeight = 100
        self.tableHeaderView = headerView
    }
}
