//
//  LooksListRouter.swift
//  GPSStyle
//
//  Created by Ivan Gorshkov on 22.10.2022.
//  
//

import UIKit

final class LooksListRouter {
    weak var viewController: UIViewController?
}

extension LooksListRouter: LooksListRouterInput {
    func goToAddLookScreen(presenter: CreateLookModuleOutput) {
        let container = CreateLookContainer.assemble(with: CreateLookContext(moduleOutput: presenter))
        viewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
}
