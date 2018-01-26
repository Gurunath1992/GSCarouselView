//
//  GSCarouselViewDelegate.swift
//  GSCarouselView
//
//  Created by Sripad, Gurunath on 22/01/18.
//  Copyright © 2018 Sripad, Gurunath. All rights reserved.
//

import Foundation

@objc protocol GSCarouselViewDelegate {
    @objc optional func swipedAllViewControllers() -> Void
    @objc optional func swipedViewControllerAtIndex(_ index:Int) -> Void
}
