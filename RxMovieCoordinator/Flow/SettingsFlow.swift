//
//  SettingsFlow.swift
//  RxMovieCoordinator
//
//  Created by Sherif Kamal on 1/15/20.
//  Copyright © 2020 Sherif Kamal. All rights reserved.
//

import UIKit
import RxFlow
import RxSwift
import RxCocoa

class SettingsFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }

    private let rootViewController = UISplitViewController()
    private let settingsStepper: SettingsStepper
    private let services: AppServices

    init(withServices services: AppServices, andStepper stepper: SettingsStepper) {
        self.settingsStepper = stepper
        self.services = services
    }

    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? MainStep else { return .none }
        switch step {
        case .settingsAreRequired:
            return navigationToSettingsScreen()
        default:
            return .none
        }
    }
    
    private func navigationToSettingsScreen() -> FlowContributors {
        let navigationController = UINavigationController()
        let settingsListViewController = SettingsListViewController.instantiate()
        let settingsLoginViewController = SettingsLoginViewController.instantiate()
        self.rootViewController.viewControllers = [settingsListViewController, settingsLoginViewController]
        self.rootViewController.preferredDisplayMode = .allVisible
        settingsLoginViewController.title = "Login"
        navigationController.viewControllers = [settingsListViewController]
        
        if let navigationBarItem = navigationController.navigationBar.items?[0] {
            let settingsButton = UIBarButtonItem(barButtonSystemItem: .done, target: self.settingsStepper, action: #selector(SettingsStepper.settingsDone))
            navigationBarItem.setRightBarButton(settingsButton, animated: false)
        }
        
        return .multiple(flowContributors: [.contribute(withNext: settingsListViewController),
                                            .contribute(withNext: settingsLoginViewController),
                                            .forwardToCurrentFlow(withStep: MainStep.alert("Demo with multiple flow"))])
        
    }
}

class SettingsStepper: Stepper {
    let steps = PublishRelay<Step>()
    var initialStep: Step {
        MainStep.settingsAreRequired
    }
    
    @objc func settingsDone() {
        self.steps.accept(MainStep.settingsAreComplete)
    }
}
