//
//  ViewController.swift
//  BinarySearch
//
//  Created by Mac123 on 2020/7/22.
//  Copyright © 2020 K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - 二分查找，一个没有重复数据的有序数组
        let idx = BinarySearch.binarySearch(array: [0,1,2,3,4,5], value: 0)
        
        //MARK: - 二分查找，查找第一个值等于给定值的元素
        let idx2 = BinarySearch.binarySearchFirstEqualToValue(array: [0,1,2,2,3,3,4,5], value: 6)
        
        //MARK: - 查找最后一个值等于给定值的元素
        let idx3 = BinarySearch.binarySearchLastEqualToValue(array: [0,1,2,2,3,3,4,5], value: 2)
        
        //MARK: - 查找第一个大于等于给定值的元素
        let idx4 = BinarySearch.binarySearchFirstBigToValue(array: [0,1,2,2,3,3,4,5], value: 3)
        
        //MARK: - 查找最后一个小于等于给定值的元素
        let idx5 = BinarySearch.binarySearchLastSmallToValue(array: [0,1,2,2,3,3,4,5], value: 5)
    }


}

