;; simple-token.clar

(define-fungible-token my-token)

(define-public (mint (amount uint))
  (ft-mint? my-token amount tx-sender)
)

(define-public (transfer (amount uint) (recipient principal))
  (ft-transfer? my-token amount tx-sender recipient)
)

(define-read-only (get-balance (user principal))
  (ok (ft-get-balance my-token user))
)
