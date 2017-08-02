//
//  ViewController.swift
//  delegateDemo_Swift
//
//  Created by KenenCS on 2017/8/2.
//  Copyright © 2017年 KenenCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController,TestDelegate {
    
    //声明属性
    var btn = UIButton();

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.white;
        self.title = "第一界面";
        
        let label = UILabel.init(frame: CGRect.init(x: 80, y: 100, width: 90, height: 30));
        label.text = "选择地点:";
        label.font = UIFont.systemFont(ofSize: 20);
        self.view.addSubview(label);
        
        self.btn = UIButton.init(frame: CGRect.init(x: 170, y: 106, width: 100, height: 20));
        self.btn.setTitle("请选择", for: .normal);
        self.btn.setTitleColor(UIColor.red, for: .normal);
        self.btn.backgroundColor = UIColor.green;
        self.btn.titleLabel?.font = UIFont.systemFont(ofSize: 15);
        self.btn.addTarget(self, action: #selector(ViewController.btnClick), for: .touchUpInside);
        self.view.addSubview(self.btn);
        
    }
    
    func btnClick() {
        let testVC = TestViewController();
        //设置的代理
        testVC.delegate = self;
        self.navigationController?.pushViewController(testVC, animated: false);
    }
    
    //在这里实现代理方法，接收代理过来的值
    func changeTheLocation(str: NSString) {
        //通过代理过来的值来改变按钮的text，即改变地点
        btn.setTitle(str as String, for: .normal);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

