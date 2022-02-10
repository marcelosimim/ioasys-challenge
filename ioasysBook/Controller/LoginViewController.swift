//
//  ViewController.swift
//  ioasysBook
//
//  Created by Marcelo Simim on 10/02/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var viewWidth: CGFloat?
    var viewHeight: CGFloat?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.9, alpha: 1)
        viewWidth = view.bounds.width
        viewHeight = view.bounds.height
        
        addComponents()
        settingConstraints()
    }
    
    //MARK: - UI Components

    lazy var backgroundImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: K.backgroundImage)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var vectorImage: UIImageView = {
        let image = UIImageView()
         image.image = UIImage(named: K.vectorImage)
         image.contentMode = .scaleAspectFit
         image.layer.compositingFilter = "overlayBlendMode"
         image.translatesAutoresizingMaskIntoConstraints = false
         return image
     }()
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
         image.image = UIImage(named: K.logoImage)
         image.contentMode = .scaleAspectFit
         image.translatesAutoresizingMaskIntoConstraints = false
         return image
     }()
    
    lazy var loginComponent = LoginComponentViewController()

    //MARK: - Setting View
    
    private func addComponents(){
        view.addSubview(backgroundImage)
        view.addSubview(vectorImage)
        view.addSubview(logoImage)
        addChild(loginComponent)
        view.addSubview(loginComponent.view)
        loginComponent.didMove(toParent: self)
        loginComponent.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Constraints
    
    private func settingConstraints(){
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            vectorImage.heightAnchor.constraint(equalToConstant: viewHeight!*0.304),
            vectorImage.widthAnchor.constraint(equalToConstant: viewWidth!*0.664),
            vectorImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vectorImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: viewWidth!*0.5),
            logoImage.widthAnchor.constraint(equalToConstant: viewWidth!*0.307),
            logoImage.heightAnchor.constraint(equalToConstant: viewHeight!*0.095),
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: viewHeight!*0.239),
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 110),
            logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -110),
            loginComponent.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loginComponent.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginComponent.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginComponent.view.topAnchor.constraint(equalTo: view.topAnchor, constant: viewHeight!*0.562)
        ])
    }
}

