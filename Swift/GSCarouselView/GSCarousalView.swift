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
    
    private func configureCarousalView() -> Void{
        numberOfPages = 2
        pageViewController = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController!.dataSource = self
        pageViewController!.delegate = self
        
        let firstWalkthroughViewController = getViewController(#imageLiteral(resourceName: "background-image"))
        let secondWalkthroughViewController =  getViewController(#imageLiteral(resourceName: "background-image"))
        
        viewControllers = [firstWalkthroughViewController, secondWalkthroughViewController]
        pageViewController!.setViewControllers([firstWalkthroughViewController], direction:.forward,animated:true, completion: nil)
        
        pageViewController!.view.frame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.addSubview(pageViewController!.view)
        
        pageControl = UIPageControl.init(frame: CGRect.init(x: 0, y: self.frame.height - 30, width: self.frame.width, height: 30))
        pageControl.numberOfPages = numberOfPages!
        pageControl.currentPage = 0
        self.addSubview(pageControl)
//        viewController.view.bringSubview(toFront: pageControl)
    }
    
    func getViewController(_ image:UIImage) -> UIViewController{
        let viewController = UIViewController()
        viewController.view.frame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        
        let imageView = UIImageView.init(frame: viewController.view.frame)
        imageView.image = image
        imageView.contentMode  = .scaleAspectFit
        viewController.view.addSubview(imageView)
        
        let title = UILabel.init(frame: CGRect.init(x: 10, y: self.frame.height - 72, width: self.frame.width-20, height: 42))
        title.numberOfLines = 2
        title.text = "Title"
        title.textColor = .white
        viewController.view.addSubview(title)
        
        
        
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
