//
//  ViewController+ PageViewControllerDelegate.swift
//  GSCarouselView
//
//  Created by Sripad, Gurunath on 07/01/18.
//  Copyright © 2018 Sripad, Gurunath. All rights reserved.
//

import Foundation
import UIKit

extension ViewController:UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let viewController = pendingViewControllers.first {
            self.pageControl.currentPage = (viewControllers?.index(of: viewController))!
        }
    }
    
}
