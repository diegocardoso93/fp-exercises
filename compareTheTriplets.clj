
(defn rate
  [a b]
  (cond
    (> a b) 1
    (< a b) 0
    :else 0))

(defn create-vector-fn [f]
  (fn [a & b] (apply mapv f a b)))

(def add (create-vector-fn +))

(def apply-rate (create-vector-fn rate))

(defn compareTriplets [a b]
  [
    (reduce + (apply-rate a b))
    (reduce + (apply-rate b a))
  ]
)


(def fptr (get (System/getenv) "OUTPUT_PATH"))

(def a (vec (map #(Integer/parseInt %) (clojure.string/split (clojure.string/trimr (read-line)) #" "))))

(def b (vec (map #(Integer/parseInt %) (clojure.string/split (clojure.string/trimr (read-line)) #" "))))

(def result (compareTriplets a b))

(spit fptr (clojure.string/join " " result) :append true)
(spit fptr "\n" :append true)
