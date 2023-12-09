(ns aoc2023.solutions.day09
  (:require [clojure.java.io :refer [reader]]
            [clojure.string :as str]))

(defn digits [line] (map #(Integer/parseInt %) (str/split line #"\s")))

(defn diffs [digits] (map (fn [a b] (- b a)) digits (drop 1 digits)))

(defn next-number [digits]
  (loop [acc (last digits)
         next-digits (diffs digits)]
    (if (every? zero? next-digits)
      acc
      (recur (+ acc (last next-digits)) (diffs next-digits)))))

(defn part-1 [lines]
  (->> lines
       (map digits)
       (map next-number)
       (reduce +)))

(defn part-2 [lines]
  (->> lines
       (map digits)
       (map reverse)
       (map next-number)
       (reduce +)))

(with-open [rdr (reader "inputs/day09.txt")]
  (let [lines (line-seq rdr)]
    (println (time (part-1 lines)))
    (println (time (part-2 lines)))))
