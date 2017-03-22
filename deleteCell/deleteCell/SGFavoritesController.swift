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
        
        let btn1 : EditButton = EditButton(size: CGSize(width: 50, height: 50), rightMargin: 50) { (indexPath, editCell) in
            self.alert(indexPath: indexPath)
        }
        btn1.backgroundColor = UIColor.red
        btn1.setTitle("删除", for: .normal)
        
        let btn2 : EditButton = EditButton(size:CGSize(width: 50, height: 50), rightMargin: 50){ (indexPath, editCell) in
            self.alert(indexPath: indexPath)
        }

        btn2.backgroundColor = UIColor.green
        btn2.setTitle("分享", for: .normal)
        
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












