#JWT Security Implementation Best Practices

## 1. Signature verification requirements
-Asymmetric encryption algorithm must be used (recommended RS256)
-Prohibit the use of the none algorithm (unsigned)
-It is necessary to verify the validity of the signature
-Regularly rotate signature keys (at least every 90 days)

## 2. Token verification checklist
-Verify the 'exp' (expiration time) declaration
-Verify the reasonableness of the 'iat' (issuance time)
-Verify 'iss' (issuer) and' aud '(audience)
-Check if 'nbf' (effective time) is included and verify
-Verify if the 'sub' (theme) is valid

## 3. Suggestions for secure storage
-Avoid storing sensitive information on the client side
-The validity period of the access token should not exceed 15 minutes
-Implement token revocation mechanism
-Use HTTPS to transmit all JWT related communications
