# Decentralized Rent Payment Escrow Smart Contract

## **Introduction**

This **Decentralized Rent Payment Escrow Smart Contract** ensures timely monthly payments, handles security deposits, and provides a dispute resolution mechanism.

## **Problem Statement**

Traditional rent payments often involve:

- **Manual Transactions:** Tenants need to remember payment dates and manually transfer rent every month.
- **Late Payments & Penalties:** Unpaid rent creates conflicts between tenants and landlords.
- **Security Deposit Issues:** Landlords may withhold security deposits unfairly.
- **Dispute Complexity:** Resolving rent-related disputes often requires expensive legal actions.

## **Solution Overview**

This smart contract provides:

✅ **Automated Rent Payments** – Ensuring landlords get paid on time.

✅ **Handling Security Deposits** – Holding deposits until the end of the lease.

✅ **Enforcing Late Payment Penalties** – Automatically deducting late fees.

✅ **Dispute Resolution System** – Freezing funds in case of disputes.

✅ **Ensuring Lease Completion Security** – Holding deposits until lease completion.

## **How It Works**

1️⃣ **Landlord Deploys Contract** – Sets the **tenant address, rent, deposit amount, and lease duration.**

2️⃣ **Tenant Deposits Security** – The tenant deposits the agreed security deposit into the contract.

3️⃣ **Monthly Automated Payments** – The tenant pays rent every month using the `payRent` function.

4️⃣ **Late Payment Penalties** – A late fee is deducted for missing a rent payment.

5️⃣ **Dispute Handling** – Either party can raise a dispute to pause payments.

6️⃣ **Security Deposit Refund** – If no dispute arises, the deposit is returned at lease end.


## **Smart Contract Features**

- **Automated Rent Payments:** Transfers rent to the landlord every 30 days.
- **Security Deposit Handling:** Funds held in escrow and refunded upon lease completion.
- **Dispute Resolution:** Allows landlords and tenants to lock funds if a dispute occurs.
- **Late Payment Penalties:** Deductions apply for delayed payments.
- **Supports ETH & ERC-20 Tokens:** Payments in stablecoins like **USDC, USDT, or native ETH**.

---

**License:** MIT License

This smart contract simplifies the rental process while ensuring fairness and automation. Let me know if you need any modifications or extra features! 🚀
