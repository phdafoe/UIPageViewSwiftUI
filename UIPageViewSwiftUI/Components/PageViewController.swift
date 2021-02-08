//
//  PageViewController.swift
//  UIPageViewSwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiek on 07/02/2021.
//

import Foundation
import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    var pages: [Page]
    
    // Crea la vista para SwiftUI lo invoque en el ciclo de vida de SwiftUI
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageVC.dataSource = context.coordinator
        return pageVC
    }
    
    // Crea la actualizacion lo que hace que esto se muy eficiente
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            //[UIHostingController(rootView: pages[0])], direction: .forward, animated: true
            [context.coordinator.controllers[0]], direction: .forward, animated: true
        )
        
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        
        var parent : PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0)}
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
    }
    
}
