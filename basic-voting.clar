;; basic-voting.clar

(define-data-var votes-a uint u0)
(define-data-var votes-b uint u0)

(define-map voted principal bool)

(define-public (vote-a)
  (if (default-to false (map-get? voted tx-sender))
      (err u400)
      (begin
        (map-set voted tx-sender true)
        (var-set votes-a (+ (var-get votes-a) u1))
        (ok true)
      )
  )
)

(define-public (vote-b)
  (if (default-to false (map-get? voted tx-sender))
      (err u400)
      (begin
        (map-set voted tx-sender true)
        (var-set votes-b (+ (var-get votes-b) u1))
        (ok true)
      )
  )
)

(define-read-only (results)
  (ok {a: (var-get votes-a), b: (var-get votes-b)})
)
