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
        if let index = viewControllers!.index(of: viewController), index != 0{
            return viewControllers![index - 1]
        }
        return nil
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = viewControllers!.index(of: viewController), index != numberOfPages! - 1{
            return viewControllers![index + 1]
        }
        return nil
    }
}
