//
//  PriceTextFieldCellViewModel.swift
//  UsedGoodsUpload
//
//  Created by haeseongJung on 2022/04/05.
//

import RxSwift
import RxCocoa

struct PriceTextFieldCellViewModel {
    let showFreeShareButton: Signal<Bool>
    let resetPrice: Signal<Void>
    
    let priceValue = PublishRelay<String?>()
    let freeSharButtonTapped = PublishRelay<Void>()
    
    init() {
        self.showFreeShareButton = Observable
            .merge(
                priceValue.map { $0 ?? "" == "0"},
                freeSharButtonTapped.map { _ in false }
            )
            .asSignal(onErrorJustReturn: false)
        
        self.resetPrice = freeSharButtonTapped
            .asSignal(onErrorSignalWith: .empty())
    }
}
