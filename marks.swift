func numofPrizes(k: Int, marks: [Int]) -> Int {

    if k < 0 {
        return 0
    }
    if k == marks.count{
        return k
    }

    var sortMarks = marks
    sortMarks = sortMarks.sorted()

    var count = 1
    var rank = 1

    var ranks = [Int]()

    if ranks.count < 1{
        ranks.append(rank)
        count += 1
    } else {
        return 0
    }

    for i in 1..<sortMarks.count{
        
        if sortMarks[i] == sortMarks[i-1]{
        ranks.append(rank)
        } else {
        ranks.append(count)
        rank += 1
        }
        count += 1
    }

    let reversedRanks = ranks.sorted() {$0 > $1}
    print(reversedRanks)

    var countDown = k
    var prizeCount = 0

    if countDown > 1{
        countDown -= 1
        prizeCount += 1
    }

    for i in 1..<reversedRanks.count{
        if countDown == 0 && reversedRanks[i] != reversedRanks[i-1]{
            break
        } else {
         if reversedRanks[i] < reversedRanks[i-1]{
            countDown -= 1
            prizeCount += 1
        } else {
            if reversedRanks[i] == reversedRanks[i-1]{
            prizeCount += 1
            if countDown == 0 && i == reversedRanks.count {
                break
            }
            }
        }   
        }
    }
    return prizeCount
}

print(numofPrizes(k: 4, marks: [2,2,2,4,5]))


