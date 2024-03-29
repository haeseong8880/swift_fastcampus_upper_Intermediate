//
//  RankingFeatureSectionView.swift
//  AppStore
//
//  Created by haeseongJung on 2022/03/29.
//

import SnapKit
import UIKit

class RankingFeatureSectionView: UIView {
    
    private var rankingFeatureList: [RankingFeature] = []
    private let cellHeight: CGFloat = 70.0
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "iPhone이 처음이라면"
        label.font = .systemFont(ofSize: 18, weight: .black)
        return label
    }()
    
    private var showAllAppButton: UIButton = {
        let button = UIButton()
        button.setTitle("모두 보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 32
        layout.minimumInteritemSpacing = 0.0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(RankingFeatureCollectionViewCell.self, forCellWithReuseIdentifier: "RankingFeatureCollectionViewCell")
        return collectionView
    }()
    
    private let separatorView = SeparatorView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        fetchData()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RankingFeatureSectionView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rankingFeatureList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RankingFeatureCollectionViewCell", for: indexPath) as? RankingFeatureCollectionViewCell else { return UICollectionViewCell() }
        cell.setup(rankingFeature: rankingFeatureList[indexPath.item])
        return cell
    }
    
}

extension RankingFeatureSectionView {
    func setup() {
        [titleLabel, showAllAppButton, collectionView, separatorView].forEach { addSubview($0) }
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(16)
            $0.trailing.equalTo(showAllAppButton.snp.leading).offset(8.0)
        }
        
        showAllAppButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(titleLabel.snp.bottom)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.height.equalTo(cellHeight * 3)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        separatorView.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(16)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}

extension RankingFeatureSectionView {
    func fetchData() {
        guard let url = Bundle.main.url(forResource: "Data/RankingFeature", withExtension: "plist") else { return }
        do {
            let data = try Data(contentsOf: url)
            let result = try PropertyListDecoder().decode([RankingFeature].self, from: data)
            rankingFeatureList = result
        } catch {
            print(error.localizedDescription)
        }
    }
}
