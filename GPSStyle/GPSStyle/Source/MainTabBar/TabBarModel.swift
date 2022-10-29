//
//  TabBarModel.swift
//  GPSStyle
//
//  Created by Ivan Gorshkov on 22.10.2022.
//

import UIKit

protocol TabBarModel: AnyObject {
    func generateTabBars() -> [UIViewController]
}

final class TabBarModelImpl: TabBarModel {
    func generateTabBars() -> [UIViewController] {
        [generateVC(
            viewController:
                HomeContainer.assemble(with: HomeContext()).viewController,
            image: Asset.tabHome.image,
            selectedImage: Asset.tabHomeFilled.image
        ),
         generateVC(
            viewController:
                ClothesListContainer.assemble(with: ClothesListContext()).viewController,
            image: UIImage(systemName: "person.fill"),
            selectedImage: UIImage(systemName: "house.fill")
        ),
         generateVC(
            viewController:
                LooksListContainer.assemble(with: LooksListContext()).viewController,
            image: UIImage(systemName: "person.fill"),
            selectedImage: UIImage(systemName: "house.fill")
        ),
         generateVC(
            viewController:
                ProfileContainer.assemble(with: ProfileContext()).viewController,
            image: UIImage(systemName: "person.fill"),
            selectedImage: UIImage(systemName: "house.fill")
        )]
        // TODO: Change Image and selectedImage To real Images
    }
    
    private func generateVC(viewController: UIViewController, image: UIImage?, selectedImage: UIImage?) -> UIViewController {
        let icon = UITabBarItem(
            title: nil,
            image: image,
            selectedImage: selectedImage
        )
        viewController.tabBarItem = icon

        let navigationController = UINavigationController(rootViewController: viewController)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = ColorName.white.color
        appearance.titleTextAttributes = [.foregroundColor: ColorName.black.color]
        navigationController.navigationBar.tintColor = ColorName.black.color
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.compactAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        
        return navigationController
    }
}
