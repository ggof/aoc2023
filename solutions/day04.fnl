(local f (require :libs.fun))
(local {: time } (require :libs/time))

(fn drop-game-nb [line]
  (let [(_ e) (line:find ":")]
    (line:sub (+ e 1))))

(fn split [char line]
  (->> (line:gmatch (.. "[^" char "]+"))
       (f.iter)
       (f.totable)))

(fn split-parts [line]
  (let [[w o] (split "|" line)]
    (print w o)
    [w o]))

(fn part-1 [lines]
  (->> lines
       (f.map drop-game-nb)
       (f.map split-parts)
       (f.totable)))

(local lines (icollect [l (io.lines "inputs/day04.txt")] l))
(time 1 #(part-1 lines))
