//
//  GSCarousalView.swift
//  GSCarouselView
//
//  Created by Sripad, Gurunath on 13/01/18.
//  Copyright © 2018 Sripad, Gurunath. All rights reserved.
//

import UIKit

class GSCarousalView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var numberOfPages:Int?
    var images:[UIImage]?
    var titles:[String]?
    var viewControllers:[UIViewController]?
    var pageViewController:UIPageViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCarousalView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureCarousalView()
    }
    
    private func configureCarousalView() -> Void{
        numberOfPages = 2
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        pageViewController = storyboard.instantiateViewController(withIdentifier: "PageViewController") as? UIPageViewController
        pageViewController!.dataSource = self
        pageViewController!.delegate = self
        
        let firstWalkthroughViewController = storyboard.instantiateViewController(withIdentifier: "FirstCarousalViewController")
        let secondWalkthroughViewController = storyboard.instantiateViewController(withIdentifier: "SecondCarousalViewController")
        
        viewControllers = [firstWalkthroughViewController, secondWalkthroughViewController]
        pageViewController!.setViewControllers([firstWalkthroughViewController], direction:.forward,animated:true, completion: nil)
        
        pageViewController?.view.frame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.addSubview(pageViewController!.view)
    }
}

extension GSCarousalView: UIPageViewControllerDelegate {
    
}

extension GSCarousalView: UIPageViewControllerDataSource {
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
