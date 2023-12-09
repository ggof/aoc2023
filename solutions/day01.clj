(ns aoc2023.solutions.day01
  (:require [clojure.java.io :refer [reader]]))

(defn only-digits [line] (re-seq #"\d" line))

(defn extremities [line] (Integer/parseInt (str (first line) (last line))))

(defn part-1 [lines] (reduce + (map extremities (map only-digits lines))))

(with-open [rdr (reader "inputs/day01.txt")]
  (println "Part 1: " (time (part-1 (line-seq rdr)))))

