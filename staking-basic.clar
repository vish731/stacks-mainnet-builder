;; staking-basic.clar

(define-data-var total-staked uint u0)
(define-map stakes principal uint)

(define-public (stake (amount uint))
  (begin
    (map-set stakes tx-sender amount)
    (var-set total-staked (+ (var-get total-staked) amount))
    (ok true)
  )
)

(define-read-only (get-stake (user principal))
  (ok (default-to u0 (map-get? stakes user)))
)

(define-read-only (get-total-staked)
  (ok (var-get total-staked))
)
