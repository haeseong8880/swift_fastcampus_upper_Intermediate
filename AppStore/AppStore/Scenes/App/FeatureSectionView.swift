//
//  FeatureSectionView.swift
//  AppStore
//
//  Created by haeseongJung on 2022/03/29.
//

import SnapKit
import UIKit

final class FeatureSectionView: UIView {
    
    private var featureList: [Feature] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 30
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FeatureSectionCollectionViewCell.self, forCellWithReuseIdentifier: "FeatureSectionViewCell")
        
        return collectionView
    }()
    
    private let separatorView = SeparatorView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        fetchData()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FeatureSectionView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featureList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureSectionViewCell", for: indexPath) as? FeatureSectionCollectionViewCell else { return UICollectionViewCell() }
        let feature = featureList[indexPath.item]
        cell.setup(feature: feature)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32, height: frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
}

extension FeatureSectionView {
    func setupView() {
        [collectionView, separatorView].forEach { addSubview($0) }
        collectionView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(16)
            $0.height.equalTo(snp.width)
            $0.bottom.equalToSuperview()
        }
        separatorView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(collectionView.snp.bottom).offset(16)
            $0.bottom.equalToSuperview()
        }
    }
}

extension FeatureSectionView {
    func fetchData() {
        guard let url = Bundle.main.url(forResource: "Data/Feature", withExtension: "plist") else { return }
        do {
            let data = try Data(contentsOf: url)
            let result = try PropertyListDecoder().decode([Feature].self, from: data)
            featureList = result
        } catch {
            print(error.localizedDescription)
        }
    }
}
