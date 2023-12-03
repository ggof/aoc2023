(local f (require :libs.fun))
(local {: time } (require :libs/time))

; not a digit or a punctuation marker -> a symbol
(local pattern "[^\\.%d]")

(fn number-pos [line]
  "transforms a line of text to an array of start-end of numbers"
  (var end 1)
  (var collected [])
  (var done false)
  (while (not done)
    (local (s e nb) (line:find "(%d+)" end))
    (if (= nil e)
        (set done true)
        (do
          (set end (+ e 1))
          (table.insert collected {: s : e : nb}))))
  (f.iter collected))

(fn adjacent-symbol? [lines y {: s : e}]
  (let [up (or (?. lines (- y 1)) "")
        up (or (string.sub up (- s 1) (+ e 1)) "") ; top line + diagonals, or ""
        mid (string.sub (. lines y) (- s 1) (+ e 1)) ; middle line with extra padding
        down (or (?. lines (+ y 1)) "")
        down (or (string.sub down (- s 1) (+ e 1)))] ; bottom line with diagonals, or ""
    (or (up:match pattern) (mid:match pattern) (down:match pattern))))

(fn filter-line [lines y line]
  (f.filter #(adjacent-symbol? lines y $) line))

(fn sum-of [line]
  (->> line
       (f.map #(. $ :nb))
       (f.sum)))

(fn part-1 [lines]
  (->> lines
  (f.map number-pos)
  (f.enumerate)
  (f.map #(filter-line lines $1 $2))
  (f.map sum-of)
  (f.sum)))

(local lines (icollect [l (io.lines "inputs/day03.txt")] l))
(time 1 #(part-1 lines))
