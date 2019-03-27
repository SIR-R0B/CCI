/* CCI 1.4
Given a string, write a function to check if it is a permutation of a palindrome. A palindrome is a word or phrase that is the same forwards and backwards. A permutation is a rearrangement of letters.The palindrome does not need to be limited to just dictionary words.
EXAMPLE
Input: Tact Coa
Output: True (permutations: "taco cat". "atco cta". etc.)
*/

func findPals(_ S: String) -> Bool {

    var result = [Int](repeating: 0, count: 26)
    var charCount = 0
    var twoCount = 0

for char in S{
let asciiValue = Int(UnicodeScalar(String(char).lowercased())!.value)
if asciiValue-97 >= 0{
result[asciiValue-97] += 1
charCount += 1
}
}

for element in result{
    if element%2==0{
        twoCount += element
    }
}

print(result)
if twoCount == charCount - 1 && charCount%2 != 0{
    return true
}
if twoCount == charCount && charCount%2 == 0{
    return true
}
return false
}

print(findPals("madam Im Adam"))
print(findPals("tact coa"))
print(findPals("foo"))
print(findPals("not a palindrome"))

/*
Gayle Solution: #197

Doesn't improve on the O(n) complexity, but has an interesting approach using a bitvector or [Bool], to just keep track of how many are odd and how many are even, if more than one odd, you return false. Ray Wenderlich has some good documentation on Swift bitvectors.

*/