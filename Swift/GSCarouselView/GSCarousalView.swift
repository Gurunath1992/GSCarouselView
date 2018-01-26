//
//  GSCarousalView.swift
//  GSCarouselView
//
//  Created by Sripad, Gurunath on 13/01/18.
//  Copyright © 2018 Sripad, Gurunath. All rights reserved.
//

import UIKit

class GSCarousalView: UIView {
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
    var delegate:GSCarouselViewDelegate?
    private var numberOfPages:Int?
    private var viewControllers:[UIViewController]?
    private var pageViewController: UIPageViewController?
    private var pageControl = UIPageControl()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCarousalView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        numberOfPages = numberOfSlides
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        numberOfPages = numberOfSlides
    }
}

extension GSCarousalView {
    
    public func configureCarousalView() -> Void{
        configureViewControllers()
        configurePageViewController()
        configurePageControl()
    }
    
    private func configureViewControllers() {
        viewControllers = []
        var i:Int = 0
        while i < numberOfPages! {
            if let viewController = getViewController(i) {
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
    
    private func getViewController(_ index:Int) -> GSCarouselViewController?{
       let viewController =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GSCarouselViewController") as? GSCarouselViewController
        if let controllerImages = images {
            viewController?.carouselImage = controllerImages[index]
        }
        if let controllerTitles = titles {
            viewController?.carouselTitle = controllerTitles[index]
        }
        return viewController
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
            if let completedSwipe = self.delegate?.swipedViewControllerAtIndex! {
                completedSwipe(index)
            }
            return viewControllers![index - 1]
        }
        reachedTerminalSlide()
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = viewControllers!.index(of: viewController), index != numberOfPages! - 1{
            if let completedSwipe = self.delegate?.swipedViewControllerAtIndex! {
                completedSwipe(index)
            }
            return viewControllers![index + 1]
        }
        reachedTerminalSlide()
        return nil
    }
    
    func reachedTerminalSlide() -> Void {
        if let completedSwipe = self.delegate?.swipedAllViewControllers! {
            completedSwipe()
        }
    }
}
