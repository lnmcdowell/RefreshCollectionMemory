//
//  ViewController.swift
//  RefreshCollectionMemory
//
//  Created by Larry Mcdowell on 2/9/20.
//  Copyright © 2020 Larry Mcdowell. All rights reserved.
//

import UIKit

struct myData {
    var names:[String]
}


class childData {
    var children:[String]
   // childData(children: ["hello","good-bye","later","minutes","adios"])
    init(children:[String]){
        self.children = children
    }
}

class myCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {

    override var prefersStatusBarHidden: Bool {
               return true
           }
    var cv:UICollectionView?
    private let reuseIdentifier = "SecondCell"
    let CELL_ID = "CELL_ID"
    var viewData:myData?
    var data:childData?
         var lastPath:IndexPath = IndexPath(item: 0, section: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
  
       
        viewData = myData(names: ["Thomas","Jerry","George","Mitch","Pam","Susan"])
        data = childData(children: ["hello","good-bye","later","minutes","adios"])
        
        let flowLayout = UICollectionViewFlowLayout()
        
        cv = UICollectionView(frame: CGRect(x: 0, y:0, width:250, height: UIScreen.main.bounds.height - 20), collectionViewLayout: flowLayout)
        cv!.backgroundColor = .yellow
        cv!.delegate = self
        cv!.dataSource = self
        cv!.register(myCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        cv!.isUserInteractionEnabled = true
        
        let viewTapGestureRec = UITapGestureRecognizer(target:self,action:#selector(handleViewTap(_:)))
        viewTapGestureRec.cancelsTouchesInView = false
        cv!.addGestureRecognizer(viewTapGestureRec)
         
          collectionView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200)
        collectionView.backgroundColor = UIColor.cyan
        collectionView.isUserInteractionEnabled = true
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: CELL_ID)
        
          
        
        
        let myContainer = UIView(frame: CGRect(x: 30, y: 240, width: 380, height: 480))// UIScreen.main.bounds.height))
             myContainer.layer.borderWidth = 10
             myContainer.layer.borderColor = UIColor.red.cgColor
       
        myContainer.layer.cornerRadius = 10
        myContainer.clipsToBounds = true
             myContainer.backgroundColor = .blue
        //myContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let mytb = UITableView(frame: CGRect(x: 0, y: 0, width: 100, height: 200), style: .plain)
               mytb.dataSource = self
               mytb.delegate = self
               mytb.register(UITableViewCell.self, forCellReuseIdentifier: "mine")
               mytb.backgroundColor = .gray
              
             
            myContainer.addSubview(cv!)
            myContainer.addSubview(mytb)
            self.view.addSubview(myContainer)
        
             cv!.translatesAutoresizingMaskIntoConstraints = false
           cv!.leadingAnchor.constraint(equalTo: myContainer.leadingAnchor, constant: 40).isActive = true
           cv!.topAnchor.constraint(equalTo: myContainer.topAnchor, constant: 40).isActive = true
           cv!.widthAnchor.constraint(equalToConstant: 150).isActive = true
           cv!.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
               mytb.translatesAutoresizingMaskIntoConstraints = false
               mytb.topAnchor.constraint(equalTo:myContainer.topAnchor, constant: 40).isActive = true
               mytb.leadingAnchor.constraint(equalTo: cv!.trailingAnchor, constant: 40).isActive = true
               mytb.widthAnchor.constraint(equalToConstant: 110).isActive = true
               mytb.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        //let childCVController = ChildCollectionViewController()
        
        
    }
    @objc func handleViewTap(_ recognizer: UIGestureRecognizer){
           collectionView.resignFirstResponder()
           print("inactivated bottom collection view")
       }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath){
        if collectionView != self.collectionView {
            let holdit = data!.children[indexPath.row]
            let swapWith = data!.children[lastPath.row]
            
            let temp1 = data!.children.remove(at:indexPath.item)
          
            data!.children.insert(swapWith,at:indexPath.item)
            
            
              let temp = data!.children.remove(at: lastPath.item)
            data!.children.insert(holdit, at:lastPath.item)
            
            
            print("selected")
            lastPath = indexPath
            cv!.reloadData()
        }
        /*else {
           let temp = viewData!.names.remove(at: lastPath.item)
            viewData!.names.insert(temp, at:indexPath.item)
            print("selected")
            lastPath = indexPath
            cv!.reloadData()
        }
 */
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
       }
       
       override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
           if collectionView == self.collectionView {
           let temp = viewData!.names.remove(at: sourceIndexPath.item)
           viewData!.names.insert(temp, at: destinationIndexPath.item)
           } else {
               print("improtve")
               let temp = data!.children.remove(at: sourceIndexPath.item)
           data!.children.insert(temp, at: destinationIndexPath.item)
           }
       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return viewData!.names.count
       }
       
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "mine") as! UITableViewCell
           cell.textLabel!.text = viewData!.names[indexPath.row]
           return cell
       }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
        return viewData!.names.count
        } else {
            return data!.children.count
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_ID, for: indexPath) as! MyCollectionViewCell
            cell.backgroundColor = UIColor.green
            cell.text = viewData!.names[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! myCell
            
            // Configure the cell
            cell.text = data!.children[indexPath.row]
            
            if indexPath.row == lastPath.row {
           
                cell.backgroundColor = UIColor.red // Selected
            }else {
                cell.backgroundColor = .orange
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView {
        return CGSize(width: 100, height: 100)
        } else {
            return CGSize(width:80,height:80)
        }
    }
}

