(ns aoc2023.solutions.day02
  (:require [clojure.string :as string]))

(def maxes {:r 12 :g 13 :b 14})

(defn color->map [[_ v k]] {(keyword k) (Integer/parseInt v)})

(defn hand->sec [hand] (map color->map (re-seq #"(\d+) (\w)" hand)))

(defn parse [line]
  (let [[id game] (string/split line #":")
        [_ id] (re-find #"(\d+)" id)
        hands (->> (string/split game #";")
                   (map hand->sec)
                   (map (partial into {})))]
    {:id (Integer/parseInt id) :hands hands}))

(defn valid-hand? [hand] (every? (fn [[k v]] (<= v (maxes k))) hand))

(defn keep-game? [{:keys [hands]}] (every? valid-hand? hands))

(defn part-1 [lines]
  (->> lines
       (map parse)
       (filter keep-game?)
       (map #(get % :id))
       (reduce +)))

(defn max-of [hands color] (apply max (map #(% color 0) hands)))

(defn power-of [{:keys [hands]}] (apply * (map (partial max-of hands) [:r :g :b])))

(defn part-2 [lines] (reduce + (map power-of (map parse lines))))

(with-open [rdr (clojure.java.io/reader "inputs/day02.txt")]
  (let [lines (line-seq rdr)]
    (println (time (part-1 lines)))
    (println (time (part-2 lines)))))
