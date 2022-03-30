//
//  StationDetailCollectionViewCell.swift
//  SubwayStation
//
//  Created by haeseongJung on 2022/03/30.
//

import SnapKit
import UIKit

class StationDetailCollectionViewCell: UICollectionViewCell {
    
    private var lineLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    private var remainTileLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    func setup(with realTimeArrival: StationArrivalDataResponseModle.RealTimeArrival) {
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 10
        
        backgroundColor = .systemBackground
        
        [ lineLabel, remainTileLabel ].forEach { addSubview($0) }
        lineLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(16)
        }
        
        remainTileLabel.snp.makeConstraints {
            $0.leading.equalTo(lineLabel)
            $0.top.equalTo(lineLabel.snp.bottom).offset(16)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        lineLabel.text = realTimeArrival.line
        remainTileLabel.text = realTimeArrival.remainTime
    }
}
