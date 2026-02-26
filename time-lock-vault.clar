;; time-lock-vault.clar

(define-data-var unlock-height uint u100000)

(define-public (withdraw (amount uint))
  (if (>= block-height (var-get unlock-height))
      (stx-transfer? amount tx-sender tx-sender)
      (err u403)
  )
)
