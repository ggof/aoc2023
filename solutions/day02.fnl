(local f (require :libs.fun))
(local max-red 12)
(local max-green 13)
(local max-blue 14)

(fn split [line]
  (let [(_ end id) (string.find line "Game (%d+):")
        hands (string.sub line (+ 2 end))
        hands (icollect [s (string.gmatch hands "[^;]+")] s)]
    {:id id :hands hands}))

(fn nb-color [color hand]
  (tonumber (or (string.match hand (.. "(%d+) " color)) 0)))

(fn valid-hand? [hand]
  (let [r (nb-color :red hand)
        g (nb-color :green hand) 
        b (nb-color :blue hand)]
      (and (<= r max-red) (<= g max-green) (<= b max-blue))))

(fn keep-game? [{:hands hands}]
  (f.all valid-hand? hands))

(fn part-1 [lines]
  (->> lines
       (f.map split)
       (f.filter keep-game?)
       (f.map #(. $ :id))
       (f.sum)))

(fn max-of [game color]
  (->> game
       (f.map (partial nb-color color))
       (f.max)))

(fn power-of [{:hands hands}] (* (max-of hands :red) (max-of hands :green) (max-of hands :blue)))

(fn part-2 [lines]
  (->> lines
       (f.map split)
       (f.map power-of)
       (f.sum)))

(let [lines (icollect [l (io.lines "inputs/day02.txt")] l)]
  (print (part-1 lines))
  (print (part-2 lines)))
