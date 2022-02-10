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
         image.translatesAutoresizingMaskIntoConstraints = false
         return image
     }()

    //MARK: - Setting View
    
    private func addComponents(){
        view.addSubview(backgroundImage)
        view.addSubview(vectorImage)
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
            vectorImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: viewWidth!*0.587),
        ])
    }
}
