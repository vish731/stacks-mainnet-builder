;; owner-storage.clar

(define-constant owner tx-sender)

(define-data-var stored-value uint u0)

(define-public (set-value (new-value uint))
  (if (is-eq tx-sender owner)
      (begin
        (var-set stored-value new-value)
        (ok true))
      (err u401)
  )
)

(define-read-only (get-value)
  (ok (var-get stored-value))
)
