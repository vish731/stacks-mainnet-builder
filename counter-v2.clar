;; counter-v2.clar

(define-data-var counter uint u0)

(define-public (increment (value uint))
  (begin
    (var-set counter (+ (var-get counter) value))
    (ok (var-get counter))
  )
)

(define-public (decrement (value uint))
  (if (>= (var-get counter) value)
      (begin
        (var-set counter (- (var-get counter) value))
        (ok (var-get counter)))
      (err u400)
  )
)

(define-read-only (get-counter)
  (ok (var-get counter))
)
