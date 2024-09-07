# Compliance with GDPR(General Data Protection Regulation) and PCI-DSS(Payment Card Industry Data Security Standard)

## GDPR Compliance:
1. **Data Encryption**: All sensitive data is encrypted at rest and in transit.
2. **Access Control**: Role-Based Access Control (RBAC) is enforced in the Kubernetes cluster.
3. **Data Subject Rights**: Infrastructure is designed to support the right to data deletion.

## PCI-DSS Compliance:
1. **Encryption**: All payment data is encrypted using AWS KMS.
2. **Logging and Monitoring**: AWS GuardDuty, CloudWatch, Prometheus, and Grafana monitor the infrastructure for suspicious activities.
3. **Access Control**: Strong authentication methods and access controls are applied.
