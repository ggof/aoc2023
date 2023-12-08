(local f (require :libs.fun))
(local { : time } (require :libs.time))

(fn search [graph instructions dst cur cnt]
  (var nextNode cur)
  (var cnt cnt)
  (while (not= dst cur)
    (set nextNode (. (. graph nextNode) (. instructions (math.mod cnt (length instructions)))))
    (set cnt (+ cnt 1)))
  cnt)

