//
//  MainStep.swift
//  RxMovieCoordinator
//
//  Created by Sherif Kamal on 1/14/20.
//  Copyright © 2020 Sherif Kamal. All rights reserved.
//

import Foundation
import RxFlow

enum MainStep: Step {
    case logoutIsRequired
    case dashboardIsRequired
    case alert(String)
    case fakeStep
    
    case loginIsRequired
    case userIsLoggedIn

    // Api Key
    case apiKeyIsRequired
    case apiKeyIsFilledIn

    // Onboarding
    case onboardingIsRequired
    case onboardingIsComplete

    // Movies
    case moviesAreRequired
    case movieIsPicked (withId: Int)
    case castIsPicked (withId: Int)

    // Settings
    case settingsAreRequired
    case settingsAreComplete

    // About
    case aboutIsRequired
    case aboutIsComplete
}
