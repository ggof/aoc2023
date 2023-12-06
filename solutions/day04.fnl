(local {: time } (require :libs/time))

(fn intersection [a b]
  (icollect [_ v (ipairs a)]
    ()))

(fn toset [table]
  (collect [_ k (ipairs table)] k true))

(fn take [nb t] (fcollect [i 1 nb] (. t i)))

(fn drop [nb t] (fcollect [i (+ nb 1) (length t)] (. t i)))

(fn drop-game-nb [line] (line:sub 10))

(fn split-numbers [part]
  (icollect [v (part:gmatch "%d+")] v))

(fn split-parts [line]
  (let [all (split-numbers line)
        wins (toset (take 10 all))
        ours (toset (drop 10 all))]
    [wins ours]))

(fn count-matching-numbers [[wins ours]]
  (accumulate [acc 0 k _ (pairs wins)]
    (if (. ours k) (+ 1 acc) acc)))

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
