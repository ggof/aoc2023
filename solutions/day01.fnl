(local f (require :libs.fun))

(fn only-digits [line] (icollect [d (string.gmatch line "%d")] d))

(fn extremities [line] (.. (. line 1) (. line (length line))))

(fn part-1 [lines] (f.sum (f.map extremities (f.map only-digits lines))))

(let [lines (icollect [l (io.lines "inputs/day01.txt")] l)]
  (print (part-1 lines)))
