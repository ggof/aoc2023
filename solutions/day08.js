const fs = require("fs")

function part1(graph, instructions) {
  const dst = "ZZZ"
  let cur = "AAA"
  let cnt = 0

  while (cur !== dst) {
    cur = graph[cur][instructions[cnt++ % instructions.length]]
  }

  return cnt
}

function part2(graph, instructions) {
  let curs = Object.keys(graph).filter(it => it.endsWith("A"))
  let cycles = curs.map((cur, i) => {
    let cnt = 0
    while (!cur.endsWith("Z")) {
      cur = graph[cur][instructions[cnt++ % instructions.length]]
    }
    return cnt
  })

  const gcd = (x, y) => (y === 0 ? x : gcd(y, x % y))
  const lcm = (arr) => arr.reduce((x, y) => (x * y) / gcd(x, y))

  return lcm(cycles)
}


const input = fs.readFileSync("inputs/day08.txt").toString()

const [instructionPart, nodesPart] = input.split("\n\n").map(it => it.trim())
const instructions = instructionPart.split("").map(it => it == "L" ? 0 : 1)
const nodes = nodesPart.split("\n").map(it => it.trim()).reduce((acc, cur) => {
  const rgx = /([A-Z]{3})+/g
  const [node, left, right] = cur.match(rgx)
  acc[node] = [left, right]
  return acc
}, {})

const s = Date.now()
console.log("part 1", part1(nodes, instructions))
console.log("took %d ms", Date.now() - s)
const s2 = Date.now()
console.log("part 2", part2(nodes, instructions))
console.log("took %d ms", Date.now() - s2)
