
(defn median [n ar]
  (if (odd? n)
    (get ar (int (/ n 2)))
    (/ (+ (get ar (- (/ n 2) 1)) (get ar (/ n 2))) 2)
  )
)

(defn quartiles [n ar]
    (clojure.string/join "\n" [ 
        (median (int (Math/floor (/ n 2))) (subvec ar 0 (/ n 2)))
        (median n ar)
        (median (int (Math/floor (/ n 2))) (subvec ar (- n (Math/floor (/ n 2)))))
    ])
)

(def fptr (get (System/getenv) "OUTPUT_PATH"))

(def n (Integer/parseInt (clojure.string/trim (read-line))))

(def ar (vec (map #(Integer/parseInt %) (clojure.string/split (read-line) #" "))))

(def result (quartiles n (vec (sort ar))))

(spit fptr (str result "\n") :append true)
