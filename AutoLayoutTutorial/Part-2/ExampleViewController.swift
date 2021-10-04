//
//  ExampleViewController.swift
//  AutoLayoutTutorial
//
//  Created by Victor Roldan on 30/09/21.
//

import UIKit
import SnapKit
import PureLayout

class ExampleViewController: UIViewController {
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var iHaveAccoutButton: UIButton!
    @IBOutlet weak var firstTimeButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureButtons()
        
        //createNativeConstraints()
        //createConstraintsSnapKit()
        createPureLayoutConstraints()
    }
    
    func createPureLayoutConstraints(){
        backgroundImage.autoMatch(.height, to: .height, of: view)
        backgroundImage.autoMatch(.width, to: .width, of: view)
        backgroundImage.autoAlignAxis(.horizontal, toSameAxisOf: view)
        backgroundImage.autoAlignAxis(.vertical, toSameAxisOf: view)
        
        logoImage.autoSetDimension(.width, toSize: 188)
        logoImage.autoSetDimension(.height, toSize: 67)
        logoImage.autoPinEdge(.leading, to: .leading, of: subtitleLabel)
        logoImage.autoPinEdge(.bottom, to: .top, of: subtitleLabel, withOffset: -13)
     
        subtitleLabel.autoPinEdge(.bottom, to: .top, of: iHaveAccoutButton, withOffset: -50)
        subtitleLabel.autoPinEdge(.leading, to: .leading, of: iHaveAccoutButton)
        subtitleLabel.autoPinEdge(.trailing, to: .trailing, of: iHaveAccoutButton)
        
        iHaveAccoutButton.autoSetDimension(.height, toSize: 55)
        iHaveAccoutButton.autoPinEdge(.bottom, to: .top, of: firstTimeButton, withOffset: -27)
        iHaveAccoutButton.autoPinEdge(.leading, to: .leading, of: view, withOffset: 23)
        iHaveAccoutButton.autoPinEdge(.trailing, to: .trailing, of: view, withOffset: -23)
        
        firstTimeButton.autoSetDimension(.height, toSize: 55)
        firstTimeButton.autoPinEdge(.bottom, to: .bottom, of: view, withOffset: -59)
        firstTimeButton.autoPinEdge(.leading, to: .leading, of: view, withOffset: 23)
        firstTimeButton.autoPinEdge(.trailing, to: .trailing, of: view, withOffset: -23)
        
    }
    
    func createConstraintsSnapKit(){
        backgroundImage.snp.makeConstraints { make in
            make.width.equalTo(view)
            make.height.equalTo(view)
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view)
        }
        
        logoImage.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).multipliedBy(0.51)
            make.height.equalTo(67)
            make.leading.equalTo(iHaveAccoutButton.snp.leading)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(13)
            make.width.equalTo(iHaveAccoutButton.snp.width)
            make.centerX.equalTo(iHaveAccoutButton.snp.centerX)
        }
        
        iHaveAccoutButton.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(50)
            make.width.equalToSuperview().multipliedBy(0.88)
            make.height.equalTo(55)
            make.centerX.equalToSuperview()
        }
        
        firstTimeButton.snp.makeConstraints { make in
            make.top.equalTo(iHaveAccoutButton.snp.bottom).offset(27)
            make.width.equalToSuperview().multipliedBy(0.88)
            make.height.equalTo(55)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom).offset(-59)
        }
    }
    
    func createNativeConstraints(){
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        iHaveAccoutButton.translatesAutoresizingMaskIntoConstraints = false
        firstTimeButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            backgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor),
            backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor),
            backgroundImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            firstTimeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -59),
            firstTimeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            firstTimeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            firstTimeButton.heightAnchor.constraint(equalToConstant: 55),
            
            
            iHaveAccoutButton.bottomAnchor.constraint(equalTo: firstTimeButton.topAnchor, constant: -27),
            iHaveAccoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            iHaveAccoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            iHaveAccoutButton.heightAnchor.constraint(equalToConstant: 55),
            
            
            subtitleLabel.widthAnchor.constraint(equalTo: iHaveAccoutButton.widthAnchor),
            subtitleLabel.centerXAnchor.constraint(equalTo: iHaveAccoutButton.centerXAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: iHaveAccoutButton.topAnchor, constant: -50),
            
            logoImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.51),
            logoImage.heightAnchor.constraint(equalToConstant: 67),
            logoImage.leadingAnchor.constraint(equalTo: iHaveAccoutButton.leadingAnchor),
            logoImage.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -13)

        ])
        
        
    }
    
    
    func configureButtons(){
        let cornerRadius = firstTimeButton.bounds.height/2
        firstTimeButton.layer.cornerRadius = cornerRadius
        
        iHaveAccoutButton.layer.cornerRadius = cornerRadius
        iHaveAccoutButton.layer.borderWidth = 1.0
        iHaveAccoutButton.layer.borderColor = UIColor(red: 217/255, green: 217/255, blue: 223/255, alpha: 0.19).cgColor
    }
}
