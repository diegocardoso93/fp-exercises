
(defn diagonalDifference [arr]
  (Math/abs (- (reduce + (map #(apply nth %) (map vector arr (range 0 (count arr)))))
            (reduce + (map #(apply nth %) (map vector arr (range (dec (count arr)) -1 -1)))))))

(def fptr (get (System/getenv) "OUTPUT_PATH"))

(def n (Integer/parseInt (clojure.string/trim (read-line))))

(def arr [])

(doseq [_ (range n)]
    (def arr (conj arr (vec (map #(Integer/parseInt %) (clojure.string/split (clojure.string/trimr (read-line)) #" ")))))
)

(def result (diagonalDifference arr))

(spit fptr (str result "\n") :append true)

