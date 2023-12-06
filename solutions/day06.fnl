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
  (local [times dists] (icollect [_ l (ipairs lines)] (string->numbers l)))
  (local races (icollect [i t (ipairs times)] (range -1 t (- (. dists i)))))
  (f.product races))

(fn part-2 [lines] 
  (let [[time dist] (icollect [_ l (ipairs lines)] (string->number l))]
  (range -1 time (- dist))))

(local lines (icollect [v (io.lines :inputs/day06.txt)] v))

(time 1 #(part-1 lines))
(time 2 #(part-2 lines))
