from collections import deque


def insertTokens(q, start, end, tokens) -> None:
        if start == end and len(tokens)>0:
            rotation = ((len(q)-end))
            q.rotate(rotation)
            q.extend(tokens)
            q.rotate(-rotation)
            #exit()
        elif len(tokens) == 0:
            return
        else:
            ogstart = start
            for i in range((end-start)):
                q.remove(q[start])
            insertTokens(q, ogstart, ogstart, tokens)


testq = deque([
    0, 1,2,3,4,5,6,7,8,9,10
])

testl = list(testq)


inserter = deque([
    "Test", "Tets123", "Bruh"
])

insertl = list(inserter)

print(testq)
insertTokens(testq, 0, 5, inserter)
print(testq)

testl[0:5] = insertl
print(testl)

print(testl == list(testq))