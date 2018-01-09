//
//  ViewController+PageViewControllerDataSource.swift
//  GSCarouselView
//
//  Created by Sripad, Gurunath on 07/01/18.
//  Copyright © 2018 Sripad, Gurunath. All rights reserved.
//

import Foundation
import UIKit

extension ViewController:UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController:UIPageViewController, viewControllerBefore viewController:UIViewController)  -> UIViewController? {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let firstWalkthroughViewController = storyboard.instantiateViewController(withIdentifier: "FirstCarousalViewController")
        return firstWalkthroughViewController
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
         let secondWalkthroughViewController = storyboard.instantiateViewController(withIdentifier: "SecondCarousalViewController")
        return secondWalkthroughViewController
    }
}
