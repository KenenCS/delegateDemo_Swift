//
//  TestViewController.swift
//  delegateDemo_Swift
//
//  Created by KenenCS on 2017/8/2.
//  Copyright © 2017年 KenenCS. All rights reserved.
//

import Foundation
import UIKit

//声明代理
protocol TestDelegate {
    func changeTheLocation(str:NSString);
}

class TestViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //声明属性 
    var delegate:TestDelegate!;
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.white;
        self.title = "二级界面";
        
        //当你写完TableView代码并遵循好代理的时候，会发现还是会报错，那是因为你没有实现这些代理，实现完就好了
        let tableView = UITableView.init(frame: UIScreen.main.bounds, style: .plain);
        tableView.delegate = self;
        tableView.dataSource = self;
        self.view.addSubview(tableView);
        
    }
    
    /***********UITableViewDelegate***********/
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell");
        if cell==nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell");
        }
        cell?.textLabel?.text = "点我";
        return cell!;
    }
    
    //cell的点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //这个代表 我们需要代理出去的数据源，当然，你可以通过indexPath.row代理出去不同row的值，我这里只是例子只做了一个
        let str = "这是新地点";
        
        //当执行这个代理并且是执行这个代理方法的时候
        if self.delegate != nil {
            //通过这个代理方法把需要的值代理过去
            self.delegate.changeTheLocation(str: str as NSString);
        }
        
        //返回上一级界面
        self.navigationController?.popViewController(animated: true);
        //取消选中
        tableView.deselectRow(at: indexPath, animated: true);
    }
    
}





