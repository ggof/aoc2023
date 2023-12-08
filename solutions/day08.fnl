(local f (require :libs.fun))
(local { : time } (require :libs.time))

(fn parse-input [input]
  (let [(_ e instructions) (string.find input "([LR]+)\n\n")
        graphPart (string.sub input e)
        graph (collect [k l r (string.gmatch graphPart "(%u%u%u) = %((%u%u%u), (%u%u%u)%)\n")] k [l r])]
    [graph instructions]))

(fn count-until [[graph instructions]]
  (print instructions)
  (var cur "AAA")
  (var cnt 1)
  (while (not= cur "ZZZ")
    (print (string.sub instructions (math.fmod cnt (length instructions)) 1)) 
    (set cur (. (. graph cur) (if (= "L" (. instructions (math.fmod cnt (length instructions)))) 0 1)))
    (set cnt (+ cnt 1)))
  (- cnt 1))


(fn part-1 [input] (count-until (parse-input input)))

(local input (with-open [file (io.open :inputs/day08.txt)] (file:read :*all)))

(time 1 #(part-1 input))
