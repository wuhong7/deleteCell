//
//  SGFavoritesController.swift
//  SouGet
//
//  Created by 盖特 on 2017/3/8.
//  Copyright © 2017年 souget.com. All rights reserved.
//

import UIKit

class SGFavoritesController: UIViewController {

    let tableView = UITableView()
    let cellHelper = deleteCellHelper.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
   


}

// MARK: - UI布局
extension SGFavoritesController{
    
    fileprivate func setupUI(){
        
        view.backgroundColor = UIColor.white
        self.title = "全部分类"
        self.setupTableView()
        
    }
    
    private func setupTableView(){
        //添加tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.cellHelper.delegate = self
        //tableView设置
        tableView.register(SGFavoritesCell.self , forCellReuseIdentifier: "cell")
        tableView.rowHeight = 200
        view.addSubview(self.tableView)
        
        self.tableView.snp_makeConstraints{ (make) -> Void in
            make.edges.equalTo(0)
            
        }

    
    }


}


// MARK: - 数据层
extension SGFavoritesController{
    
    
}


// MARK: - delegate
extension SGFavoritesController:UITableViewDelegate,UITableViewDataSource,deleteCellDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    
    func deleteTableView() -> (buttonArray: [EditButton]?, currentTableView: UITableView?) {
        
        let btn1 : EditButton = EditButton(size: CGSize(width: 70, height: 70), rightMargin: 30) { (indexPath, editCell) in
            self.alert(indexPath: indexPath)
        }
        
        let str = NSAttributedString.imageTextWith(image: UIImage(named: "home_card")!, imageWH: 35, title: "删除", fontSize: 14, titleColor: UIColor.white, spacing: 7)
        btn1.setAttributedTitle(str, for: .normal)
        //设置换行
        btn1.titleLabel?.numberOfLines = 0;
        //文字居中
        btn1.titleLabel?.textAlignment = .center;
        btn1.backgroundColor = UIColor.red
        
        
        
        
        let btn2 : EditButton = EditButton(size:CGSize(width: 70, height: 70), rightMargin: 30){ (indexPath, editCell) in
            self.alert(indexPath: indexPath)
        }
        let str1 = NSAttributedString.imageTextWith(image: UIImage(named: "home_xiu")!, imageWH: 35, title: "分享", fontSize: 14, titleColor: UIColor.white, spacing: 7)
        btn2.setAttributedTitle(str1, for: .normal)
        btn2.titleLabel?.numberOfLines = 0;
        btn2.titleLabel?.textAlignment = .center;
        btn2.backgroundColor = UIColor.green
       
        
        return ([btn1,btn2],tableView)
    }
    
    
    
    
    
    fileprivate func alert(indexPath:IndexPath){
        
        let alert = UIAlertController(title: "提示", message: "\(indexPath)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .default) { (_) in
            printLog(message: "嘿嘿")
        })
        
        self.present(alert, animated: true, completion: nil)
    }
    
}












