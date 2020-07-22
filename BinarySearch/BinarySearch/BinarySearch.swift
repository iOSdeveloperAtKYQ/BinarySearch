//
//  BinarySearch.swift
//  List
//
//  Created by Mac123 on 2020/5/18.
//  Copyright © 2020 SW. All rights reserved.
//

import UIKit

class BinarySearch: NSObject {
    
    /// 二分查找，一个没有重复数据的有序数组
    /// - Parameters:
    ///   - array: 没有重复数据的有序数组
    ///   - value: 指定的值
    /// - Returns: 位置下标
    class func binarySearch(array: Array<Int>, value: Int) -> Int {
        var low = 0
        var high = array.count - 1
        while low <= high {
            let mid = low + (high - low) >> 1
            if array[mid] == value {
                return mid
            }else if array[mid] > value {
                high = mid - 1
            }else {
                low = mid + 1
            }
        }
        return -1
    }
    
    
    /// 二分查找，查找第一个值等于给定值的元素
    /// - Parameters:
    ///   - array: 有序数组
    ///   - value: 指定的值
    /// - Returns: 位置下标
    class func binarySearchFirstEqualToValue(array: Array<Int>, value: Int) -> Int {
        var low = 0
        var high = array.count - 1
        while low <= high {
            let mid = low + (high - low) >> 1
            if array[mid] > value {
                high = mid - 1
            }else if array[mid] < value {
                low = mid + 1
            }else {
                //如果mid等于第一个元素或者mid的前一个元素的值不等于value，就说明是mid所处的位置是第一个值等于给定值的元素
                if mid == 0 || (array[mid - 1] != value) {
                    return mid
                }else {
                    high = mid - 1
                }
            }
        }
        return -1
    }
    
    /// 二分查找，查找最后一个值等于给定值的元素
    /// - Parameters:
    ///   - array: 有序数组
    ///   - value: 指定的值
    /// - Returns: 位置下标
    class func binarySearchLastEqualToValue(array: Array<Int>, value: Int) -> Int {
        var low = 0
        var high = array.count - 1
        while low <= high {
            let mid = low + (high - low) >> 1
            if array[mid] > value {
                high = mid - 1
            }else if array[mid] < value {
                low = mid + 1
            }else {
                //如果mid等于第后一个元素或者mid的后一个元素的值不等于value，就说明是mid所处的位置是最后一个值等于给定值的元素
                if (mid == array.count - 1) || (array[mid + 1] != value) {
                    return mid
                }else {
                    low = mid + 1
                }
            }
        }
        return -1
    }
    
    /// 二分查找，查找第一个大于等于给定值的元素
    /// - Parameters:
    ///   - array: 有序数组
    ///   - value: 指定的值
    /// - Returns: 位置下标
    class func binarySearchFirstBigToValue(array: Array<Int>, value: Int) -> Int {
        var low = 0
        var high = array.count - 1
        while low <= high {
            let mid = low + (high - low) >> 1
            if array[mid] >= value {
                //如果mid等于第一个元素或者mid的前一个元素的值小于value，就说明是mid所处的位置是第一个值大于等于给定值的元素
                if mid == 0 || (array[mid - 1] < value) {
                    return mid
                }else {
                    high = mid - 1
                }
            }else {
                low = mid + 1
            }
        }
        return -1
    }
    
    /// 二分查找，查找最后一个小于等于给定值的元素
    /// - Parameters:
    ///   - array: 有序数组
    ///   - value: 指定的值
    /// - Returns: 位置下标
    class func binarySearchLastSmallToValue(array: Array<Int>, value: Int) -> Int {
        var low = 0
        var high = array.count - 1
        while low <= high {
            let mid = low + (high - low) >> 1
            if array[mid] <= value {
                if (mid == array.count - 1) || (array[mid + 1] > value) {
                    return mid
                }else {
                    low = mid + 1
                }
            }else {
                high = mid - 1
            }
        }
        return -1
    }
}
