# BinarySearch
二分查找
1. 查找值等于给定值的元素
```objectivec
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
```
2. 查找第一个值等于给定值的元素

```objectivec
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
```

3. 查找最后一个值等于给定值的元素

```objectivec
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
```

4. 查找第一个大于等于给定值的元素

```objectivec
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
```

5. 查找最后一个小于等于给定值的元素

```objectivec
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
```
二分查找有**3 个容易出错**的地方。
1. 循环退出条件
 注意是 low<=high，而不是 low
2. mid 的取值
实际上，mid=(low+high)/2 这种写法是有问题的。因为如果 low 和 high 比较大的话，两者之和就有可能会溢出。改进的方法是将 mid 的计算方式写成 low+(high-low)/2。更进一步，如果要将性能优化到极致的话，我们可以将这里的除以 2 操作转化成位运算 low+((high-low)>>1)。因为相比除法运算来说，计算机处理位运算要快得多。
3. low 和 high 的更新
low=mid+1，high=mid-1。注意这里的 +1 和 -1，如果直接写成 low=mid 或者 high=mid，就可能会发生死循环。比如，当 high=3，low=3 时，如果 a[3]不等于 value，就会导致一直循环不退出。
