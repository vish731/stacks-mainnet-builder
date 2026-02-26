;; nft-mint-v2.clar

(define-non-fungible-token my-nft uint)

(define-data-var last-id uint u0)

(define-public (mint)
  (let ((new-id (+ (var-get last-id) u1)))
    (begin
      (var-set last-id new-id)
      (nft-mint? my-nft new-id tx-sender)
    )
  )
)

(define-read-only (get-last-id)
  (ok (var-get last-id))
)
