// CCI 1.2 given two strings, write a method to decide if one is a permutation of the other

func checkPerm(_ A: String, _ B: String) -> Bool {

   /* if A.count != B.count || A.lowercased().sorted() != B.lowercased().sorted() {
        return false
    }*/ //non-case sensitive implementation

    if A.count != B.count || A.sorted() != B.sorted() {
        return false
    }

    return true
}

func gayle(_ A: String, _ B: String) -> Bool {

    //assume case sensitive and white-space sensitive

    var a = [Int](repeating: 0, count: 128) //assume ascii original (128) 
    var b = [Int](repeating: 0, count: 128)

    if A.count != B.count {return false}

    for charAsciiValue in A.utf8{
        a[Int(charAsciiValue)] += 1
    }

    for charAsciiValue in B.utf8{
        b[Int(charAsciiValue)] += 1
    }

    return  (a == b) ? true : false

}

print(checkPerm("sDHSa","AseHd"))  // false
print(checkPerm("sDHSa","DHass")) // true (not case-sensitive) or false (case-sensitive)
print(checkPerm("sDHSa","DHaSs")) //true 
print(checkPerm("sDHSa","DHa Ss")) //true (not whitepace sensitive) or false(whitespace sensitive)
print(checkPerm("sD H","H Ds")) //true (whitepace sensitive)
print("Gayle")
print(gayle("sDHSa","AseHd"))  // false
print(gayle("sDHSa","DHass")) // true (not case-sensitive) or false (case-sensitive)
print(gayle("sDHSa","DHaSs")) //true 
print(gayle("sDHSa","DHa Ss")) //true (not whitepace sensitive) or false(whitespace sensitive)
print(gayle("sD H","H Ds")) //true (whitepace sensitive)

/* Gayle Solution
> assumptions: case sensitive? whitespace sensitive?
> observe: diff string length == not perms
> solution1: sort the strings (advantages: clean, simple)
> solution2: more efficient, check character set ascii normal or extended or unicode, and count appearances of values for both arrays, finally at the end, compare the two arrays
*/
