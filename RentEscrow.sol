// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RentEscrow {
    address public landlord;
    address public tenant;
    uint256 public rentAmount;
    uint256 public securityDeposit;
    uint256 public lastPaymentTime;
    uint256 public leaseDuration;
    bool public disputeRaised;

    enum LeaseStatus {
        ACTIVE,
        COMPLETED,
        DISPUTED
    }
    LeaseStatus public status;

    constructor(
        address _tenant,
        uint256 _rentAmount,
        uint256 _securityDeposit,
        uint256 _leaseDuration
    ) {
        landlord = msg.sender;
        tenant = _tenant;
        rentAmount = _rentAmount;
        securityDeposit = _securityDeposit;
        leaseDuration = _leaseDuration;
        lastPaymentTime = block.timestamp;
        status = LeaseStatus.ACTIVE;
    }

    modifier onlyTenant() {
        require(msg.sender == tenant, "Only tenant allowed");
        _;
    }

    modifier onlyLandlord() {
        require(msg.sender == landlord, "Only landlord allowed");
        _;
    }

    function payRent() external payable onlyTenant {
        require(status == LeaseStatus.ACTIVE, "Lease is not active");
        require(msg.value == rentAmount, "Incorrect rent amount");
        require(
            block.timestamp >= lastPaymentTime + 30 days,
            "Rent not due yet"
        );

        lastPaymentTime = block.timestamp;
        payable(landlord).transfer(msg.value);
    }

    function raiseDispute() external onlyTenant {
        require(status == LeaseStatus.ACTIVE, "Cannot dispute inactive lease");
        disputeRaised = true;
        status = LeaseStatus.DISPUTED;
    }

    function resolveDispute(bool refundTenant) external onlyLandlord {
        require(disputeRaised, "No dispute to resolve");

        if (refundTenant) {
            payable(tenant).transfer(address(this).balance);
        } else {
            payable(landlord).transfer(address(this).balance);
        }

        status = LeaseStatus.COMPLETED;
    }

    function endLease() external onlyTenant {
        require(status == LeaseStatus.ACTIVE, "Lease must be active");
        require(
            block.timestamp >= lastPaymentTime + leaseDuration,
            "Lease duration not over"
        );

        payable(tenant).transfer(securityDeposit);
        status = LeaseStatus.COMPLETED;
    }

    function depositSecurity() external payable onlyTenant {
        require(msg.value == securityDeposit, "Incorrect deposit amount");
    }
}
