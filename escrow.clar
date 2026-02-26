;; escrow.clar

(define-data-var buyer principal tx-sender)
(define-data-var seller principal tx-sender)
(define-data-var amount uint u0)
(define-data-var released bool false)

(define-public (init (seller-address principal) (amt uint))
  (begin
    (var-set seller seller-address)
    (var-set amount amt)
    (ok true))
)

(define-public (release)
  (if (not (var-get released))
      (begin
        (var-set released true)
        (stx-transfer? (var-get amount) (var-get buyer) (var-get seller))
      )
      (err u409)
  )
)
