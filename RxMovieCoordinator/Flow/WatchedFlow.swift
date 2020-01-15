//
//  WatchedFlow.swift
//  RxMovieCoordinator
//
//  Created by Sherif Kamal on 1/15/20.
//  Copyright © 2020 Sherif Kamal. All rights reserved.
//

import UIKit
import RxFlow

class WatchedFlow: Flow {
    var root: Presentable {
        rootViewController
    }
    
    private let rootViewController = UINavigationController()
    private let services: AppServices

    init(withServices services: AppServices) {
        self.services = services
    }

    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? MainStep else { return .none }
        switch step {
        case .moviesAreRequired:
            return navigateToMovieListScreen()
        case .movieIsPicked(let movieId):
            return navigationToMovieDetailsScreen(with: movieId)
        default:
            return .none
        }
    }
    
    private func navigateToMovieListScreen() -> FlowContributors {
        let viewController = WatchedViewController.instantiate(withViewModel: WatchedViewModel(), andServices: services)
        viewController.title = "Watched"
        self.rootViewController.pushViewController(viewController, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: viewController.viewModel))
    }
    
    private func navigationToMovieDetailsScreen(with movieId: Int) -> FlowContributors {
        let viewController = MovieDetailViewController.instantiate(withViewModel: MovieDetailViewModel(withMovieId: movieId), andServices: self.services)
        viewController.title = viewController.viewModel.title
        self.rootViewController.pushViewController(viewController, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: viewController.viewModel))
    }
    
    private func navigationToCastScreen(with castId: Int) -> FlowContributors {
        let viewController = CastDetailViewController.instantiate(withViewModel: CastDetailViewModel(withCastId: castId), andServices: self.services)
        viewController.title = viewController.viewModel.name
        self.rootViewController.pushViewController(viewController, animated: true)
        return .none
    }
}
