const fs = require("fs")

function searchLoop(graph, instructions, cur, dst) {
  let cnt = 0

  while (cur !== dst) {
    cur = graph[cur][instructions[cnt % instructions.length]]
    cnt++
  }

  return cnt
}

const input = fs.readFileSync("inputs/day08.txt").toString()


const rgx = /([A-Z]{3})+/g

const [instructionPart, nodesPart] = input.split("\n\n").map(it => it.trim())
const instructions = instructionPart.split("").map(it => it == "L" ? 0 : 1)
const nodes = nodesPart.split("\n").map(it => it.trim()).reduce((acc, cur) => {
  const [node, left, right] = cur.match(rgx)
  acc[node] = [left, right]
  return acc
}, {})

const s = Date.now()
console.log("part 1", searchLoop(nodes, instructions, "AAA", "ZZZ"))
console.log("took %d ms", Date.now() - s)
