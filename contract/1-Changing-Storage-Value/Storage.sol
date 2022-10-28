pragma solidity 0.8.16;

contract StorageGas {
    uint256 val;

    function setToZero() external {
        val = 0;
    }

    function setToOne() external {
        val = 1;
    }

    function setToTwo() external {
        val = 2;
    }

    /*
     CASE1) zero -> zero
     setToZero() : (23,444)
     = Gtranaction + Gcoldsload(2,100) + Gwarmaccess(100) + @(244)
     
     CASE2) zero -> non-zero
     setToOne() : (43,322)
     = Gtransaction + Gcoldsload(2,100) + Gsset(20,000)  + @(211)
     
     CASE3) non-zero -> zero
     setToOne() : 43,322
     setToZero() : (21,444)
     = Gtransaction + Gcoldsload(2,100) + Gsreset(2,900) - refund(4,800) + @(244)
     
     CASE4) non-zero -> non-zero (changing to same value)
     setToOne() : 43,322
     setToOne() : (23,422)
     = Gtransaction + Gcoldsload(2,100) + Gwarmaccess(100) + @(222)
     
     CASE5) non-zero -> non-zero (chainging to different value)
     setToOne() : 43,322
     setToTwo() : (26,200)
     = Gtransaction + Gcoldsload(2,100) + Gsreset(2,900) + @(200)
     */
}