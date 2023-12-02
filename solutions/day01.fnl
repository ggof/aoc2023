(local mapper [:one :two :three :four :five :six :seven :eight :nine])

(fn map [f c] (icollect [_ v (ipairs c)] (f v)))

(fn word->digit [line]
  (accumulate [acc line
               number word (ipairs mapper)]
    (string.gsub acc word number)))

(fn only-digits [line] (icollect [d (string.gmatch line "%d")] d))

(fn extremities [line] (.. (. line 1) (. line (length line))))

(fn sum-of [lines]
  (accumulate [acc 0
               _ cur (ipairs lines)]
    (+ acc cur)))

(fn part-1 [lines] (sum-of (map extremities (map only-digits lines))))

(fn part-2 [lines] (part-1 (map word->digit lines)))

(let [lines (icollect [l (io.lines "inputs/day01.txt")] l)]
  (print (part-1 lines))
  (print (part-2 lines)))
