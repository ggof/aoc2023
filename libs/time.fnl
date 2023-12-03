(fn time [part f]
  (local start (os.clock))
  (print (string.format "part %d: " part) (f))
  (local end (os.clock))
  (print "time:\t" (string.format "%.4fms" (* 1000 (- end start)))))

{:time time}
