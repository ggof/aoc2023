(ns aoc2023.day01.solver
  (:gen-class)
  (:require [clojure.string :as str]))

(defn take-only-numbers [line] (vec (re-seq #"\d" line)))

(defn first-and-last-as-number [digits]
  (parse-long (str/join [(first digits) (peek digits)])))

(defn part-1 [input]
  (->> input
       (str/split-lines)
       (map take-only-numbers)
       (map first-and-last-as-number)
       (apply +)))

;; (defn part-2 [input]
;;   (->> input
;;        (str/split-lines)
;;        (map take-only-numbers-and-written-numbers)
;;        (map first-and-last-as-number)
;;        (apply +)))

(defn main []
  (let [input (slurp "inputs/day01.txt")]
    (println (part-1 input))))
    ;; (print (part-2 input))))
