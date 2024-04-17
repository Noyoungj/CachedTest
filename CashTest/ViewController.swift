//
//  ViewController.swift
//  CashTest
//
//  Created by 노영재(Youngjae No)_인턴 on 4/16/24.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    // MARK: - UI
    private let image = UIImageView().then{
        $0.contentMode = .scaleAspectFit
    }
    
    private let textField = UITextField().then{
        $0.placeholder = "URL을 입력하세요."
        $0.addLeftPadding(12)
    }
    
    private let button = UIButton().then {
        $0.setTitle("Load", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 15
        
        $0.addTarget(self, action: #selector(clickAction), for: .touchUpInside)
    }
    
    private func addSubviews() {
        self.view.addSubview(image)
        self.view.addSubview(textField)
        self.view.addSubview(button)
    }
    
    private func setLayouts() {
        image.snp.makeConstraints{
            $0.top
                .leading
                .equalTo(self.view.safeAreaLayoutGuide).offset(12)
            $0.trailing
                .equalTo(self.view.safeAreaLayoutGuide).offset(-12)
            $0.bottom
                .equalTo(self.view.snp.centerY).offset(-12)
        }
        
        textField.snp.makeConstraints{
            $0.top
                .equalTo(self.image.snp.bottom).offset(24)
            $0.leading
                .trailing
                .equalTo(image)
            $0.height
                .equalTo(70)
        }
        
        button.snp.makeConstraints{
            $0.leading
                .trailing
                .equalTo(textField)
            $0.bottom
                .equalTo(self.view.safeAreaLayoutGuide).offset(-12)
            $0.height
                .equalTo(70)
        }
    }
    
    // MARK: - Action
    @objc
    private func clickAction() {
        guard let text = self.textField.text else { return }
        
        self.image.setImageUrl(text)
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addSubviews()
        setLayouts()
    }
}

// MARK: - ImageCacheManager
class ImageCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}


