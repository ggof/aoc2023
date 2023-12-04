(local f (require :libs.fun))
(local {: time } (require :libs/time))

(fn drop-game-nb [line]
  (let [(_ e) (line:find ":")]
    (line:sub (+ e 1))))

(fn split [char line]
  (icollect [v (string.gmatch line (.. "[^" char "]+"))] v))

(fn split-numbers [part]
  (icollect [v (part:gmatch "%d+")] v))

(fn split-parts [line]
  (icollect [_ v (ipairs (split "|" line))] (split-numbers v)))

(fn count-matching-numbers [[wins ours]]
  (accumulate [acc 0 _ v (ipairs wins)]
    (if (f.index v ours) (+ 1 acc) acc)))

(fn power-of-2 [nb]
  (if (= nb 0)
      0
      (^ 2 (- nb 1))))

(fn part-1 [lines]
  (accumulate [acc 0 _ l (ipairs lines)] 
    (->> (drop-game-nb l)
         (split-parts)
         (count-matching-numbers)
         (power-of-2)
         (+ acc))))

(local lines (icollect [l (io.lines "inputs/day04.txt")] l))
(time 1 #(part-1 lines))
