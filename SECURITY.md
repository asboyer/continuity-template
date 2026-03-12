# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability, please report it responsibly.

- **Do NOT** open a public GitHub issue for security vulnerabilities.
- Email: `<security-contact-email>`
- Include: description, reproduction steps, and potential impact.
- Expected response time: `<X business days>`

## Supported Versions

| Version | Supported |
|---------|-----------|
| latest  | Yes       |

## Security Practices

- Secrets and credentials must never be committed. Use `.env` files (gitignored).
- Dependencies should be kept up to date. Use automated tooling where possible.
- Pre-commit hooks enforce basic hygiene (merge conflict markers, large files).
- CI runs all quality checks on every PR.
