;; escrow-advanced.clar

(define-data-var buyer principal tx-sender)
(define-data-var seller principal tx-sender)
(define-data-var amount uint u0)
(define-data-var funded bool false)

(define-public (init (seller-address principal) (amt uint))
  (begin
    (var-set seller seller-address)
    (var-set amount amt)
    (ok true)
  )
)

(define-public (fund)
  (begin
    (var-set funded true)
    (ok true)
  )
)

(define-public (release)
  (if (var-get funded)
      (stx-transfer? (var-get amount) (var-get buyer) (var-get seller))
      (err u403)
  )
)
