(ns aoc2023.solutions.day04
  (:require [clojure.math :refer [pow]]
            [clojure.set :refer [intersection]]
            [clojure.java.io :refer [reader]]))

(defn drop-game-nb [line] (subs line 10))

(defn split-numbers [line]
  (->> line
       (re-seq #"(\d+)")
       (map first)
       (map #(Integer/parseInt %))))

(defn split-parts [line]
  (let [nbs (split-numbers line)
        wins (set (take 10 nbs))
        ours (set (drop 10 nbs))]
    [wins ours]))

(defn count-matching-numbers [[wins ours]]
  (count (intersection wins ours)))

(defn power-of-2 [nb]
  (if (= nb 0)
    0
    (pow 2 (dec nb))))

(defn part-1 [lines]
  (->> lines
       (map drop-game-nb)
       (map split-parts)
       (map count-matching-numbers)
       (map power-of-2)
       (reduce +)
       (int)))

(with-open [rdr (reader "inputs/day04.txt")]
  (let [lines (line-seq rdr)]
    (println (time (part-1 lines)))))
