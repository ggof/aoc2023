(local f (require :libs.fun))
(local { : time } (require :libs.time))

(fn split-double-newline [text arr]
  (let [(start-pos end-pos) (string.find text "\n\n")]
    (if (= nil start-pos)
      (doto arr (table.insert text))
      (split-double-newline (string.sub text end-pos)
                            (doto arr (table.insert (string.sub text 1 start-pos)))))))

(fn parse [lines]
  (icollect [d s l (string.gmatch lines "(%d+) (%d+) (%d+)\n")] 
    [(tonumber d) (tonumber s) (tonumber l)]))

(fn parse-seed [line] 
  (icollect [d (string.gmatch line "(%d+)")] 
    (tonumber d)))

(fn in-line? [cur d s l]
  (let [ll (- cur s)]
    (if (and (< ll l) (>= ll 0))
        (+ d ll)
        nil)))

(fn next-index [cur [[d s l] & tl]]
  (let [next (in-line? cur d s l)]
    (if (or (= 0 (length tl)) (not= nil next))
      next
      (next-index cur tl))))

(fn seed->location [s maps]
  (accumulate [acc s _ m (ipairs maps)]
    (or (next-index acc m) acc)))

(fn part-1-with-parser [text]
  (let [[seeds & maps] (split-double-newline text [])
        seeds (parse-seed seeds)
        maps (icollect [_ v (ipairs maps)] (parse v))]
    (f.min (f.map #(seed->location $ maps) seeds))))

(with-open [file (io.open :inputs/day05.txt)]
  (let [text (file:read :*all)]
    (time 5 #(part-1-with-parser text))))
