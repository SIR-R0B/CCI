// CCI 1.2 given two strings, write a method to decide if one is a permutation of the other

func checkPerm(_ A: String, _ B: String) -> Bool {

    if A.count != B.count || A.lowercased().sorted() != B.lowercased().sorted() {
        return false
    }

    return true
}

print(checkPerm("sDHSa","AseHd"))