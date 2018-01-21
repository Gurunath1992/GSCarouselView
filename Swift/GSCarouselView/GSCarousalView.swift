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
    
    
    @IBInspectable
    var numberOfSlides:Int{
        get {
            return 3
        }
        set {
            self.numberOfPages = newValue
        }
    }
    
    var images:[UIImage]?
    var titles:[String]?
    private var numberOfPages:Int?
    private var viewControllers:[UIViewController]?
    private var pageViewController: UIPageViewController?
    private var pageControl = UIPageControl()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCarousalView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureCarousalView()
    }
}

extension GSCarousalView {
    
    public func configureCarousalView() -> Void{
        numberOfPages = numberOfSlides
        configureViewControllers()
        configurePageViewController()
        configurePageControl()
    }
    
    private func configureViewControllers() {
        viewControllers = []
        var i:Int = 0
        while i < numberOfPages! {
            if let viewController = getViewController("GSCarouselViewController") {
                viewController.carouselImage = #imageLiteral(resourceName: "background-image")
                viewController.carouselTitle = "Carousel Title"
                viewControllers?.append(viewController)
            }
            else {
                viewControllers?.append(UIViewController())
            }
            i = i + 1
        }
    }
    
    private func configurePageViewController() {
        pageViewController = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController!.dataSource = self
        pageViewController!.delegate = self
        
        pageViewController!.setViewControllers([viewControllers![0]], direction:.forward,animated:true, completion: nil)
        
        pageViewController!.view.frame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.addSubview(pageViewController!.view)
    }
    
    private func configurePageControl() {
        pageControl = UIPageControl.init(frame: CGRect.init(x: 0, y: self.frame.height - 30, width: self.frame.width, height: 30))
        pageControl.numberOfPages = numberOfPages!
        pageControl.currentPage = 0
        self.addSubview(pageControl)
    }
    
    private func getViewController(_ identifier:String) -> GSCarouselViewController?{
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier) as? GSCarouselViewController
    }
}

extension GSCarousalView: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let viewController = pendingViewControllers.first {
            self.pageControl.currentPage = (viewControllers?.index(of: viewController))!
        }
    }
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
