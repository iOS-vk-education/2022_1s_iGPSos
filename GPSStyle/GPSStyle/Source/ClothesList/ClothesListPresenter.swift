//
//  ClothesListPresenter.swift
//  GPSStyle
//
//  Created by Ivan Gorshkov on 22.10.2022.
//  
//

import Foundation

final class ClothesListPresenter {
    weak var view: ClothesListViewInput?
    weak var moduleOutput: ClothesListModuleOutput?
    
    private let router: ClothesListRouterInput
    private let interactor: ClothesListInteractorInput
    private var data: [ClothingModel] = []
    
    init(router: ClothesListRouterInput, interactor: ClothesListInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ClothesListPresenter: ClothesListModuleInput {
}

extension ClothesListPresenter: ClothesListViewOutput {
    func getCloth(index: Int) -> ClothingModel {
        data[index]
    }
    
    var countList: Int {
        data.count
    }
    
    func viewWillAppear() {
        interactor.fetchClothing()
    }
    
    func addButtonDidTap() {
        router.goToAddClothesScreen()
    }
}

extension ClothesListPresenter: ClothesListInteractorOutput {
    func clothDidLoad(with array: [ClothingModel]) {
        data = array
        view?.reloadData()
    }
}
