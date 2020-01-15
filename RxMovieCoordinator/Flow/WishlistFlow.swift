//
//  WishlistFlow.swift
//  RxMovieCoordinator
//
//  Created by Sherif Kamal on 1/14/20.
//  Copyright © 2020 Sherif Kamal. All rights reserved.
//

import UIKit
import RxFlow
import RxSwift

class WishlistFlow: Flow {
    
    var root: Presentable {
        return rootViewController
    }
    
    private let rootViewController = UINavigationController()
    private let wishlistStepper: WishlistStepper
    private let services: AppServices
    
    init(services: AppServices, wishlistStepper: WishlistStepper) {
        self.wishlistStepper = wishlistStepper
        self.services = services
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? MainStep else { return .none }
        
        switch step {
        case .moviesAreRequired:
            return navigateToMovieListScreen()
        default:
            return .none
        }
    }
    
    private func navigateToMovieListScreen() -> FlowContributors {
        let viewController = WishlistViewController.instantiate(withViewModel: WishlistViewModel(), andServices: self.services)
        viewController.title = "Wishlist"
        self.rootViewController.pushViewController(viewController, animated: true)
        if let navigationBarItem = self.rootViewController.navigationBar.items?[0] {
            navigationBarItem.setRightBarButton(UIBarButtonItem(image: UIImage(named: "settings"),
                                                                style: UIBarButtonItem.Style.plain,
                                                                target: self.wishlistStepper,
                                                                action: #selector(WishlistStepper.settingsAreRequired)),
                                                                animated: false)
            navigationBarItem.setLeftBarButton(UIBarButtonItem(image: UIImage(named: "Logout"),
                                                               style: UIBarButtonItem.Style.plain,
                                                               target: self.wishlistStepper,
                                                               action: #selector(WishlistFlow.logoutIsRequired)),
                                                               animated: false)
        }
    }
    
    private func navigationToMovieDetailsScreen(with movieId: Int) -> FlowContributors {
        let viewController = MovieDetailViewController.instantiate(withViewModel: MovieDetailViewModel(withMovieId: movieId), andServices: self.services)
        viewController.title = viewController.viewModel.title
        self.rootViewController.pushViewController(viewController, animated: true)
        return .none
    }
    
    private func navigationToSettings() -> FlowContributors {
        let settingsStepper = 
    }
    
    @objc func logoutIsRequired() {
        self.services.preferencesService.setNotOnboarded()
    }
}
