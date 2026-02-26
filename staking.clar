;; staking.clar

(define-map stakes principal uint)

(define-public (stake (amount uint))
  (begin
    (map-set stakes tx-sender amount)
    (ok true))
)

(define-read-only (get-stake (user principal))
  (ok (default-to u0 (map-get? stakes user)))
)
