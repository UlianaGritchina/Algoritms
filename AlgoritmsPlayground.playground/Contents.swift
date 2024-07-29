import Foundation

// -----------------------------
// MARK: Grind 75 questions    |
// -----------------------------
// https://www.techinterviewhandbook.org/grind75

// MARK: - 1. Two Sum (1)

/**
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target. You may assume that each input would have exactly one solution, and you may not use the same element twice. You can return the answer in any order.
 
 ## Notes: ##
 1. O(n)
 2. Using dictionary/hash table
 3. https://leetcode.com/problems/two-sum/description/
 
 ## Example ##
 ```
 twoSum2([1,3,4,6], 5)
 ```
 */
func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    var dict: [Int: Int] = [:]
    for (index, value) in nums.enumerated() {
        if let necessaryElement = dict[value] {
            return [necessaryElement, index]
        } else {
            dict[target - value] = index
        }
    }
    return []
}

// MARK: - 20. Valid Parentheses (2)

/**
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 ## An input string is valid if: ##
 - Open brackets must be closed by the same type of brackets.
 - Open brackets must be closed in the correct order.
 - Every close bracket has a corresponding open bracket of the same type.
 
 ## Notes: ##
 1. O(n)
 2. https://leetcode.com/problems/valid-parentheses/description/
 
 ## Example ##
 ```
 isValid("}()")
 ```
 */
func isValid(_ s: String) -> Bool {
    var result = false
    
    let dict = ["(":")", "{":"}", "[":"]"]
    
    for (index, bracket) in s.enumerated() {
        guard index != s.count - 1 else { return result }
        let a = dict[String(bracket)] ?? ""
        let second = String(s[String.Index(encodedOffset: index + 1)])
        if second == a {
            result = true
        } else {
            result = false
        }
    }
    return result
}

// MARK: - 21. Merge Two Sorted Lists (3)


// MARK: - 121. Best Time to Buy and Sell Stocks (4)

/**
 You are given an array prices where prices[i] is the price of a given stock on the ith day.
 You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
 Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0
 
 ## Notes: ##
 1. O(n)
 2. https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/
 
 ## Example ##
 ```
 maxProfit([7,1,5,3,6,4])
 ```
 */
func maxProfit(_ prices: [Int]) -> Int {
    var maxProfit = 0
    var minPrice = prices[0]
    
    for price in prices {
        if price < minPrice {
            minPrice = price
        }
        if price - minPrice > maxProfit {
            maxProfit = price - minPrice
        }
    }
    return maxProfit
}


// MARK: - 125. Valid Palindrome (5)

/**
 A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers. Given a string s, return true if it is a palindrome, or false otherwise.
 
 ## Notes: ##
 1. O(n)
 2. https://leetcode.com/problems/valid-palindrome/submissions/1337319679/
 
 ## Example ##
 ```
 isPalindrome("ab_a")
 ```
 */
func isPalindrome(_ s: String) -> Bool {
    var stringArray: [String] = []
    
    for character in s {
        if character.isLetter || character.isNumber {
            stringArray.append(String(character).lowercased())
        }
    }
    let formattedString = stringArray.joined()
    
    return formattedString == String(formattedString.reversed())
}


// MARK: - 226. Invert Binary Tree (6)


// MARK: - 242. Valid Anagram (7)

/**
 Given two strings s and t, return true if t is an anagram of s, and false otherwise.

 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
 
 ## Notes: ##
 1. O(n log n + m log m)
 2. https://leetcode.com/problems/valid-palindrome/submissions/1337319679/
 
 ## Example ##
 ```
 isAnagram("alfdjaldk", "adljflakjlf")
 ```
 */
func isAnagram(_ s: String, _ t: String) -> Bool {
    s.sorted() == t.sorted()
}

isAnagram("alfdjaldk", "adljflakjlf")


// MARK: - 704. Binary Search (8)

/**
 Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.
 You must write an algorithm with O(log n) runtime complexity.
 
 ## Notes: ##
 1. O(log n)
 2. https://leetcode.com/problems/binary-search/description/
 
 ## Example ##
 ```
 search([-1,0,3,5,9,12], 9)
 ```
 */
func search(_ nums: [Int], _ target: Int) -> Int {
    var low = 0
    var high = nums.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        let guess = nums[mid]
        if guess == target {
            return mid
        }
        if guess > target {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return -1
}
