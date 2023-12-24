open System
open System.IO

let firstDigit cond = Seq.find cond
let lastDigit cond = Seq.rev >> firstDigit cond

let calibrationValue cond line =
    [| firstDigit cond line; lastDigit cond line |] |> String |> int

let lines = File.ReadLines("inputs/day01.txt")

let part1 (lines: string seq) =
    lines |> Seq.map seq |> Seq.map (calibrationValue Char.IsDigit) |> Seq.sum

printfn "part 1: %d" (part1 lines)
