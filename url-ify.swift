/* CCI 1.3
URLify: Write a method to replace all spaces in a string with '%20: You may assume that the string has sufficient space at the end to hold the additional characters, and that you are given the "true" length of the string. (Note: If implementing in Java, please use a character array so that you can perform this operation in place.)
EXAMPLE
Input: "Mr John Smith    " 13 Output: "Mr%20John%20Smith"
*/

func urlIfy(_ S: String, _ size: Int) -> String {

    var result = ""
    var sArr = Array(S)
    var j = 0

    for i in 0..<size{
        if sArr[i] == " "{
            var temp = sArr[j..<i]
            var join = String(temp) + "%20"
            result += join
            j = i+1
        }
    }

    var temp = sArr[j..<size]
    result += temp

    return result
}

print(urlIfy("Mr John Smith    ", 13))

/*
Gayle Solution:

*/