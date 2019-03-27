// CCI 1.1 == implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?

func isUnique(_ S: String) -> Bool {
    //assume ascii extended, string lengths greater than 255 cannot have all unique
    if S.count > 256 { return false }

var lows = Array(S.lowercased()).sorted()

for i in 0...lows.count-2{
    if lows[i] == lows[i+1]{
        return false
    }
    //added a traverse from the back of the array to increase speed
    if lows[lows.count-1-i] == lows[lows.count-2-i]{
        return false
    }
}

return true

}


func gayle(_ s: String) -> Bool {
    //assume extended ascii
    if s.count > 256 {return false}
    var boolArray = [Bool](repeating: false, count: 256)

    //note: utf8 ascii values are not Ints, and cannot be used as subscript without explicit conversion to Int
    for asciiValue in s.utf8{
    if boolArray[Int(asciiValue)] == true {return false}
    boolArray[Int(asciiValue)] = true    
    }

    return true
}

print(isUnique("Nose"))
print(isUnique("Grass"))
print(isUnique("permutation"))
print(gayle("Nose"))
print(gayle("Grass"))
print(gayle("permutation"))

/*
In my solution, I sort the list in O(nlogn) time, then compare adjacent characters while traversing the array front to back and back to front
*/

/*
Gayle Solution:
> ask interviewer first - ascii string or unicode? if unicode, increase the storage size (some unicode chars are more than a byte)
> ascii for simplicity sake, 128 characters in original ascii, 256 characters if we're using extended ascii.. (this means you can immediately return false if string length greater than 128 || or in the case of extended ascii, 256 characters, since you can't have a unique string in that context with greater than that amount of characters.
> lesson is to clarify all assumptions with the interviewer
> O(n) algorithm is to create a array of booleans, where i maps to the ascii value, once you increment i for a second time, immediately return false
*/
