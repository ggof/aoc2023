(ns aoc2023.solutions.day08
  (:require [clojure.string :as str]))

(defn part-1 [graph instructions]
  (loop [cur "AAA"
         [step & steps] (cycle instructions)
         cnt 0]
    (if (= cur "ZZZ") cnt
        (recur ((graph cur) (if (= step "L") 0 1)) steps (inc cnt)))))

(defn main []
  (let [input (slurp "inputs/day08.txt")
        [instructions lines] (str/split input #"\n\n")
        graph (into {} (for [line (str/split-lines lines)]
                         (let [[_ k l r] (re-matches #"([A-Z]{3}) = \(([A-Z]{3}), ([A-Z]{3})\)" line)]
                           {k [l r]})))]
    (part-1 graph instructions)))

(time main)