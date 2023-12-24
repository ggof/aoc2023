(fn dump [t]
  (each [_ v (ipairs t)]
    (if (= (type v) "table") 
        (do (print) (dump v))
        (print v))))

(fn split-on-rec [del text arr]
  (let [(start-pos end-pos) (string.find text del)]
    (if (= nil start-pos)
      (doto arr (table.insert text))
      (split-on-rec del (string.sub text end-pos) (doto arr (table.insert (string.sub text 1 start-pos)))))))

(fn split-on [del text] (split-on-rec del text []))

{: dump : split-on}
