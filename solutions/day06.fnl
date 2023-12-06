(local f (require :libs.fun))
(local { : time } (require :libs.time))

(fn string->numbers [line]
  (icollect [v (string.gmatch line "(%d+)")] (tonumber v)))

(fn string->number [line]
  (tonumber 
    (accumulate [acc "" d (string.gmatch line "(%d+)")] 
      (.. acc d))))

(fn discriminant [a b c]
  (math.sqrt (- (^ b 2) (* 4 a c))))

(fn range [a b c]
  (let [d (discriminant a b c)
        x1 (math.ceil (/ (+ (- b) d) (* 2 a)))
        x2 (math.ceil (/ (- (- b) d) (* 2 a)))]
    (- x2 x1)))

(fn part-1 [lines]
  (let [[times dists] (f.totable (f.map string->numbers lines))]
    (f.product (f.map #(range -1 $1 (- $2)) (f.zip times dists)))))

(fn part-2 [lines] 
  (let [[time dist] (f.totable (f.map string->number lines))]
    (range -1 time (- dist))))

(local lines (icollect [v (io.lines :inputs/day06.txt)] v))

(time 1 #(part-1 lines))
(time 2 #(part-2 lines))
