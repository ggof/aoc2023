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

function binadryGCD(a, b) {
  while (true) {
    a >>>= Math.clz32(a)
    b >>>= Math.clz32(b)

    if (a == b) return a

    if (a < b) b = b - a
    else a = a - b
  }
}

function LCM(arr) {
  return arr.reduce((x, y) => (x * y) / binadryGCD(x, y))
}

function part2(graph, instructions) {
  let curs = Object.keys(graph).filter(it => it.endsWith("A"))
  let cycles = curs.map((cur) => {
    let cnt = 0
    while (!cur.endsWith("Z")) {
      cur = graph[cur][instructions[cnt++ % instructions.length]]
    }
    return cnt
  })

  return LCM(cycles)
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

const time = (fn) => {
  const now = performance.now()
  const result = fn()
  const elapsed = performance.now() - now
  return [result, elapsed]
}

console.log("Part 1: %d in %d", ...time(part1.bind(null, nodes, instructions)))
console.log("Part 2: %d in %d", ...time(part2.bind(null, nodes, instructions)))
