//
//  CategoryViewController.swift
//  SOVIS1
//
//  Created by sgcs on 2016. 7. 5..
//  Copyright © 2016년 JJ. All rights reserved.
//

import UIKit

class CategoryCell : UITableViewCell {
    
    @IBOutlet weak var Title: UILabel!
    
    weak var dataTask: NSURLSessionDataTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

class CategoryViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet var tableView: UITableView!
    
    let List = ["대형마트","편의점","어린이집,유치원","학교","학원","주차장","주유소,충전소","은행","문화시설","중개업소","공공기관","관광명소","숙박","음식점","카페","병원","약국"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //기존의 구분선 삭제하기
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 테이블 행의 갯수
        return self.List.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 주어진 행에 맞는 데이터 소스를 가져옴
        let cell = self.tableView.dequeueReusableCellWithIdentifier("CategoryCell") as! CategoryCell
        let item = self.List[indexPath.row]
        
        //구분선역할을 할 뷰를 선언
        let separatorLineView: UIView = UIView(frame: CGRectMake(0, 0, view.frame.size.width, 5))
        //뷰의 색을 지정 여기에 이미지를 넣을 수도 있습니다
        separatorLineView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        
        //셀에 추가하기
        cell.contentView.addSubview(separatorLineView)
        
        cell.Title.text = item
        return cell
    }
    
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = cell as? MajorCell {
            cell.dataTask?.cancel()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "CategorySegue")
        {
            let Select = segue.destinationViewController as! DataViewController
            let myindex = self.tableView.indexPathForSelectedRow!
            Select.row = myindex.row
        }
    }
    
}