//
//  MainViewController.swift
//  InstagramCloneCoding
//
//  Created by 이강욱 on 2021/10/02.
//

import Foundation
import UIKit

class MainPageViewController: UIPageViewController {
    var pageViewControllerList = [UIViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        createPageViewController()
        setupPageViewController()
    }
    
    func createPageViewController() {
        let addViewController = UIViewController()
        addViewController.view.backgroundColor = .red
        let mainViewController = UIViewController()
        mainViewController.view.backgroundColor = .green
        let dmViewController = UIViewController()
        dmViewController.view.backgroundColor = .blue
        
        pageViewControllerList.append(addViewController)
        pageViewControllerList.append(mainViewController)
        pageViewControllerList.append(dmViewController)
    }
    
    func setupPageViewController() {
        self.delegate = self
        self.dataSource = self
        setViewControllers([pageViewControllerList[1]], direction: .forward, animated: true, completion: nil)
    }
    
}

extension MainPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pageViewControllerList.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return pageViewControllerList.last
        }
        guard pageViewControllerList.count > previousIndex else {
            return nil
        }
        return pageViewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pageViewControllerList.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard pageViewControllerList.count != nextIndex else {
            return pageViewControllerList.first
        }
        guard pageViewControllerList.count > nextIndex else {
            return nil
        }
        return pageViewControllerList[nextIndex]
    }
}
