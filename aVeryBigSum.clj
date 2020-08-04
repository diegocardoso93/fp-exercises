
(defn aVeryBigSum [ar]
    (reduce + ar)
)

(def fptr (get (System/getenv) "OUTPUT_PATH"))

(def ar-count (Integer/parseInt (clojure.string/trim (read-line))))

(def ar (vec (map #(Long/parseLong %) (clojure.string/split (read-line) #" "))))

(def result (aVeryBigSum ar))

(spit fptr (str result "\n") :append true)
